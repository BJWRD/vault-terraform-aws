FROM centos
MAINTAINER BJWRD "brad.whitcomb97@gmail.com" # Change the name and email address accordingly

###Setting centos mirrors
RUN cd /etc/yum.repos.d/ \
    && sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* \
    && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* 

###Further container configuration
RUN yum update -y \
    && useradd vault \
    && mkdir /vault \
    && chown -R vault:vault /vault 

### Installing vault
RUN yum install -y yum-utils \
    && yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo \
    && yum -y install vault

###Vault path
ENV PATH="PATH=$PATH:$PWD/vault"

###Exposing port
EXPOSE 8080

###Running vault
ENTRYPOINT ["vault"]
