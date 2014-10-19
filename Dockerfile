FROM dfranssen/docker-base
MAINTAINER Dirk Franssen "dirk.franssen@gmail.com"

ENV VERSION 4.5

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN echo "deb http://downloads.sourceforge.net/project/sonar-pkg/deb binary/" >> /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y --force-yes sonar

ENV SONAR_BASE /opt/sonar
WORKDIR /opt/sonar

RUN mkdir /sonarqube-data
RUN ln -s /sonarqube-data ${SONAR_BASE}/data
VOLUME /sonarqube-data

RUN echo "sonar.web.javaOpts=-server -Dfile.encoding=UTF-8" >> conf/sonar.properties

EXPOSE 9000

#Add plugins
ADD plugins/sonar-build-stability-plugin-1.2.1.jar /${SONAR_BASE}/extensions/plugins
ADD plugins/sonar-checkstyle-plugin-2.1.1.jar /${SONAR_BASE}/extensions/plugins
ADD plugins/sonar-cobertura-plugin-1.6.3.jar /${SONAR_BASE}/extensions/plugins
ADD plugins/sonar-findbugs-plugin-3.0.jar /${SONAR_BASE}/extensions/plugins
ADD plugins/sonar-generic-coverage-plugin-1.1.jar /${SONAR_BASE}/extensions/plugins
ADD plugins/sonar-jira-plugin-1.2.jar /${SONAR_BASE}/extensions/plugins
ADD plugins/sonar-jmeter-plugin-0.2.jar /${SONAR_BASE}/extensions/plugins
ADD plugins/sonar-pmd-plugin-2.2.jar /${SONAR_BASE}/extensions/plugins
ADD plugins/sonar-sonargraph-plugin-3.3.jar /${SONAR_BASE}/extensions/plugins

CMD ["/opt/sonar/bin/linux-x86-64/sonar.sh", "console", "/bin/bash"]
