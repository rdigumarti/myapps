FROM ubi8

MAINTAINER Rajesh <test@test.com>

RUN yum -y install httpd && yum clean all

RUN echo " Welcome to Red Hat Openshift" > /var/www/html.index.html

EXPOSE 80

ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
