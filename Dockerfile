FROM dfranssen/docker-base
MAINTAINER Dirk Franssen "dirk.franssen@gmail.com"

ENV VERSION 4.5

RUN apt-get install unzip
RUN curl -sSLo /sonar.zip http://dist.sonar.codehaus.org/sonarqube-${VERSION}.zip && \
    echo "a39a52a29344b422029bd8b04d1cb84d  /sonar.zip" | md5sum -c && \
    unzip /sonar.zip && \
    rm /sonar.zip

ENV SONAR_BASE /sonarqube-$VERSION
WORKDIR /sonarqube-4.5

RUN mkdir /sonarqube-data
RUN ln -s /sonarqube-data /sonarqube-$VERSION/data
VOLUME /sonarqube-data

RUN echo "sonar.web.javaOpts=-server" >> conf/sonar.properties

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
