FROM registry.access.redhat.com/ubi8/ubi:8.0
MAINTAINER Rajesh <test@test.com>
RUN yum -y install httpd && yum clean all
RUN sed -ri -e "/^Listen 80/c\Listen 8080" /etc/httpd/conf/httpd.conf && \
    chown -R apache:apache /etc/httpd/logs/ && \
    chown -R apache:apache /run/httpd/
USER apache    
RUN echo " Welcome to Red Hat Openshift" > /var/www/html.index.html
EXPOSE 8080
CMD ["httpd", "-D", "FOREGROUND"]
