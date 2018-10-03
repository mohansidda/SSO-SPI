# SSO-SPI
This customised RH SSO image is used to integrate with SPI -> https://github.com/keycloak/keycloak/tree/openshift-integration/examples/providers/user-storage-jpa with Informix database.

````
To build the ustomised RH SSO image run following commands :

docker build -t mysso .

docker run mysso:latest

`````

This will build the RH SSO registry.access.redhat.com/redhat-sso-7/sso71-openshift:1.1 image + SPI plug-in code

