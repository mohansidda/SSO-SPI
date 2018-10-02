FROM registry.access.redhat.com/redhat-sso-7/sso71-openshift:1.1
MAINTAINER chakradhar Jonagam

# Temporarily elevate permissions
USER root

# Copy JAR & set right permissions
ADD user-storage-jpa-example.jar /opt/eap/standalone/deployments/user-storage-jpa-example.jar
RUN cd /opt/eap/standalone/deployments && \
chown jboss:jboss user-storage-jpa-example.jar && \
chmod 644 user-storage-jpa-example.jar


# Drop permissions
USER jboss
