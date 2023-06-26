FROM registry.access.redhat.com/ubi8/ubi-minimal

RUN microdnf install -y httpd
WORKDIR /app
COPY index.html /var/www/html/.
COPY settings.html /var/www/html/.

USER root

# Fix per https://bugzilla.redhat.com/show_bug.cgi?id=1192200
#RUN yum -y install deltarpm yum-utils --disablerepo=*-eus-* --disablerepo=*-htb-* *-sjis-*\
#    --disablerepo=*-ha-* --disablerepo=*-rt-* --disablerepo=*-lb-* --disablerepo=*-rs-* --disablerepo=*-sap-*

#RUN yum-config-manager --disable *-eus-* *-htb-* *-ha-* *-rt-* *-lb-* *-rs-* *-sap-* *-sjis* > /dev/null

# Update image
#RUN yum install httpd


# Add configuration file
# ADD action /var/www/cgi-bin/action
# RUN echo "PassEnv DB_SERVICE_SERVICE_HOST" >> /etc/httpd/conf/httpd.conf
# RUN chown root:apache /var/www/cgi-bin/action
# RUN chmod 755 /var/www/cgi-bin/action
# RUN echo "The Web Server is Running" > /var/www/html/index.html
EXPOSE 80

# Start the service
CMD mkdir /run/httpd ; /usr/sbin/httpd -D FOREGROUND