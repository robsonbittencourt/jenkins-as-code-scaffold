FROM jenkins/jenkins:2.479.3-lts-jdk21

USER root

COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

RUN mkdir /usr/share/jenkins-as-code
ENV CASC_JENKINS_CONFIG=/usr/share/jenkins-as-code
COPY definitions/ /usr/share/jenkins-as-code

USER jenkins

RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state