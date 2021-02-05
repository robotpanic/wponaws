data "template_file" "webbootstrap" {
  template = "${file("templates/webbootstrap.tpl")}"

  vars = {
    database_address = "${aws_instance.database.private_ip}"
  }
}

data "template_file" "dbbootstrap" {
  template = "${file("templates/dbbootstrap.tpl")}"
}
