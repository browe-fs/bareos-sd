FROM centos:7

RUN yum update -y

RUN curl -Ls http://download.bareos.org/bareos/release/17.2/CentOS_7/bareos.repo \
> /etc/yum.repos.d/bareos.repo

RUN yum install -y wget

RUN wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm && rpm -Uvh epel-release-latest-6.noarch.rpm
RUN wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm && rpm -Uvh remi-release-6*.rpm

RUN yum install -y bareos-storage
RUN yum clean all

ADD entrypoint.sh /entrypoint.sh

COPY entrypoint.sh /etc/init.d

EXPOSE 9103

ENTRYPOINT ["/entrypoint.sh"]
WORKDIR "/etc/init.d"

CMD ["/usr/sbin/bareos-sd", "-c", "/etc/bareos/bareos-sd.conf", "-u", "bareos", "-f"]

