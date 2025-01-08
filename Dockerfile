FROM jenkins/jenkins:2.479.3-lts-jdk21

USER root

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

RUN mkdir /usr/share/jenkins-as-code
ENV CASC_JENKINS_CONFIG=/usr/share/jenkins-as-code
COPY definitions/ /usr/share/jenkins-as-code

USER jenkins

ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false