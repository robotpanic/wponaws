# wponaws
# PURPOSE:
Run Web Server in AWS, alongside wit a MySQL database as a backend

# HOWTO:
0. PREREQUISITE - Contact me for the AWS Credentials  ; Install git  
I. Clone the repository to your Working Environment (The current Documentation covers MacOS Big Sur and Linux - OpenSuse Leap)   
   git clone https://github.com/robotpanic/wponaws.git  
II. Change directory to the wponaws  
    cd wponaws  
III. terraform initialization (The terraform executables for Linux 64 bit and Mac (M1/Intel) are within the bin directory.)  
     ./bin/Mac/terraform_Mac init  
     OR
     ./bin/Linux/terraform_Linux init  
     OR BEST PRACTICE   
     Copy over the binary to your $PATH and work locally. The remainder of the documentation covers this approach, having "terraform" binary in your $PATH  
IV. terraform plan  
V.  terraform apply   
VI. When you are done - terraform destroy  


