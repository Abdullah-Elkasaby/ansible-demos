FROM ubuntu

# sudo is added to be used later for installing and managing services
RUN apt update -y && apt install ssh -y && apt install sudo -y 

# the user ansible is added to the sudoers
RUN adduser ansible
RUN echo "ansible:123" | chpasswd
RUN usermod -aG sudo ansible

ENTRYPOINT service ssh restart && bash