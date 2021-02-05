data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]

  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
#  count         = 1
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.private-subnet.id}"
  user_data     = "${data.template_file.webbootstrap.rendered}"

  security_groups = [
    "${aws_security_group.sgweb.id}",
  ]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "16"
    delete_on_termination = true
  }

}

resource "aws_instance" "database" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.private-subnet.id}"
  user_data     = "${data.template_file.dbbootstrap.rendered}"

  security_groups = [
    "${aws_security_group.sgdb.id}",
  ]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "16"
    delete_on_termination = true
  }

}

resource "aws_elb" "default" {
  name               = "wordpress-elb"
  subnets            = ["${aws_subnet.public-subnet.id}"]
#  instances          = [aws_instance.web.id]
#  instances          = ["${aws_instance.web.*.id}"]
#  instances          = ["{$aws_instance.web.*.id[count.index]}"]
  instances          = ["${aws_instance.web.id}"]

  security_groups = [
    "${aws_security_group.sgweb.id}",
  ]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:80"
    interval            = 5
  }
}
