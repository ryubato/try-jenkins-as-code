FROM jenkins/jenkins:lts-jdk11
# USER root
# ENV TZ Asia/Seoul
# RUN rm /etc/localtime && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY jenkins-casc.yaml /usr/share/jenkins/ref/jenkins-casc.yaml
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false -Dorg.apache.commons.jelly.tags.fmt.timeZone=Asia/Seoul
ENV CASC_JENKINS_CONFIG /usr/share/jenkins/ref/jenkins-casc.yaml