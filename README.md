docker-sonar
============

A dockerfile with a standalone [Sonar Qube 4.5](http://www.sonarqube.org/)

In order to run it:

		docker run -d --name mysonar-data -v /sonarqube-data busybox:ubuntu-14.04 true
    docker run -d --name mysonar -p 3435:9000 --volumes-from mysonar-data dfranssen/docker-sonar
