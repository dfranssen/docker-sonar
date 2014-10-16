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
CMD ["bin/linux-x86-64/sonar.sh", "console"]
