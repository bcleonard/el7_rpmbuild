FROM centos:7.1.1503
MAINTAINER Bradley Leonard <bradley@stygianresearch.com> 

# install basic development tools
RUN yum -y update\
  && yum -y install desktop-file-utils gcc glibc-static make redhat-rpm-config rpm-build\
  && yum clean all

# Enable EPEL repository
RUN rpm -Uvh http://mirror.steadfast.net/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

# install dependencies for duplicati
RUN yum -y install dos2unix gnome-sharp-devel mono-devel webcore-fonts-vista\
  && rpm -Uvh ftp://ftp.pbone.net/mirror/li.nux.ro/download/nux/dextop/el7/x86_64/webcore-fonts-vista-3.0-1.noarch.rpm\
  && yum clean all

#
# add the run script
#
ADD run.sh /tmp/run.sh
RUN chmod 755 /tmp/run.sh

CMD ["/tmp/run.sh"]
