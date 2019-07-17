FROM tomcat:8-jre8-alpine

RUN apk upgrade --update && \
    apk add --no-cache gettext && \
    rm -rf /tmp/* /var/cache/apk/*

COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml.tmpl
COPY context.xml /usr/local/tomcat/conf/
COPY tomcat-manager-web.xml /usr/local/tomcat/webapps/manager/WEB-INF/web.xml
COPY libs/* /usr/local/tomcat/lib/
COPY setenv.sh /usr/local/tomcat/bin/
COPY entrypoint.sh /usr/local/tomcat/bin/

VOLUME /usr/local/tomcat/webapps
VOLUME /usr/local/tomcat/logs
VOLUME /var/external-files

ENV JAVA_XMS -Xms256m
ENV JAVA_XMX -Xmx378m

ENTRYPOINT ["/usr/local/tomcat/bin/entrypoint.sh"]

CMD ["catalina.sh", "run"]
