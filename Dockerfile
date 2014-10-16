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
CMD ["/opt/sonar/bin/linux-x86-64/sonar.sh", "console", "/bin/bash"]
