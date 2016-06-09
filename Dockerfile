FROM centos:7.2.1511
MAINTAINER Bradley Leonard <bradley@stygianresearch.com> 

# install basic development tools, epel, dovecot prereqs, duplicati
RUN yum -y install deltarpm epel-release\
  && yum -y install automake desktop-file-utils gcc glibc-static make redhat-rpm-config rpm-build\
  mariadb-libs postgresql-libs openssl openssl-devel\
  dos2unix gnome-sharp-devel mono-devel\
  && yum clean all

# install dovecot rpms
RUN rpm -ivh https://www.mirrorservice.org/sites/dl.atrpms.net/el7-x86_64/atrpms/stable/dovecot-2.2.10-1_14.el7.x86_64.rpm https://www.mirrorservice.org/sites/dl.atrpms.net/el7-x86_64/atrpms/stable/dovecot-devel-2.2.10-1_14.el7.x86_64.rpm

# install dependencies for duplicati
RUN rpm -Uvh ftp://ftp.pbone.net/mirror/li.nux.ro/download/nux/dextop/el7/x86_64/webcore-fonts-vista-3.0-1.noarch.rpm

#
# add the run script
#
ADD run.sh /tmp/run.sh
RUN chmod 755 /tmp/run.sh

CMD ["/tmp/run.sh"]
