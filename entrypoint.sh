#!/bin/bash
set -e

echo 'Run entrypoint'
envsubst '$TOMCAT_USER $TOMCAT_PASSWORD' < /usr/local/tomcat/conf/tomcat-users.xml.tmpl > /usr/local/tomcat/conf/tomcat-users.xml
echo 'Entrypoint refreshed'
echo 'tomcat-users result conf:'
cat /usr/local/tomcat/conf/tomcat-users.xml
echo \<?xml version=\"1.0\" encoding=\"UTF-8\"?\>\<Context antiResourceLocking=\"false\" privileged=\"true\" \>\</Context\> > /usr/local/tomcat/webapps/manager/META-INF/context.xml
cat /usr/local/tomcat/webapps/manager/META-INF/context.xml

exec "$@"
