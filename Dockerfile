FROM centos:7.1.1503
MAINTAINER Bradley Leonard <bradley@stygianresearch.com> 

# install basic development tools
RUN yum -y update\
 && yum -y install desktop-file-utils gcc glibc-static make redhat-rpm-config rpm-build\
 && yum clean all

# install dependencies
#RUN yum -y install desktop-file-utils\
#&& yum clean all

#
# add the run script
#
ADD run.sh /tmp/run.sh
RUN chmod 755 /tmp/run.sh

CMD ["/tmp/run.sh"]
