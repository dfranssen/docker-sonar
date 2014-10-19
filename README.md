docker-sonar
============

A dockerfile with a standalone [Sonar Qube 4.5](http://www.sonarqube.org/)

Following plugins will be available as well:
* sonar-build-stability-plugin-1.2.1.jar
* sonar-checkstyle-plugin-2.1.1.jar
* sonar-cobertura-plugin-1.6.3.jar
* sonar-findbugs-plugin-3.0.jar
* sonar-generic-coverage-plugin-1.1.jar
* sonar-jira-plugin-1.2.jar
* sonar-jmeter-plugin-0.2.jar
* sonar-pmd-plugin-2.2.jar
* sonar-sonargraph-plugin-3.3.jar

In order to run it:

		docker run -d --name mysonar-data -v /sonarqube-data busybox:ubuntu-14.04 true
    docker run -d --name mysonar -p 3435:9000 --volumes-from mysonar-data dfranssen/docker-sonar
