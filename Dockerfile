FROM registry.access.redhat.com/redhat-sso-7/sso71-openshift:1.1
#FROM registry.access.redhat.com/redhat-sso-7/sso72-openshift
MAINTAINER Mohan Sidda 

# Temporarily elevate permissions
USER root
RUN rm -f /opt/eap/standalone/configuration/standalone-openshift.xml
RUN rm -rf $JBOSS_HOME/standalone/configuration/standalone_xml_history
# Copy JAR & set right permissions
ADD user-storage-jpa-example.jar /opt/eap/standalone/deployments/user-storage-jpa-example.jar
ADD com /opt/eap/modules/com
ADD standalone-openshift.xml /opt/eap/standalone/configuration/standalone-openshift.xml 
RUN cd /opt/eap/standalone/deployments && \
chown jboss:jboss user-storage-jpa-example.jar && \
chmod 644 user-storage-jpa-example.jar && \
cd /opt/eap/standalone/configuration && \
chown jboss:jboss standalone-openshift.xml && \
chmod 644 standalone-openshift.xml && \
cd /opt/eap/modules && \
chown -R jboss:jboss com && \
chmod -R 755 com

# Drop permissions
USER jboss
