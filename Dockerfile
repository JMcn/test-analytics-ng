FROM maven:3.3.9-jdk-7

MAINTAINER JMcn <411164348@qq.com>

ADD pom.xml /root/pom.xml
ADD src /root/src
ADD settings.xml /root/.m2/settings.xml
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

WORKDIR /root

mvn compile

mvn package

EXPOSE 80 8080

ENTRYPOINT ["/docker-entrypoint.sh"]