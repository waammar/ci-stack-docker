FROM jenkins

USER root
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
USER jenkins

COPY plugins.txt /var/jenkins_home/plugins.txt
RUN /usr/local/bin/plugins.sh /var/jenkins_home/plugins.txt

# Adding default Jenkins Jobs
COPY jobs/atom-develop-unit-tests.xml /usr/share/jenkins/ref/jobs/atom-develop-unit-tests/config.xml
COPY jobs/atom-releases-unit-tests.xml /usr/share/jenkins/ref/jobs/atom-releases-unit-tests/config.xml
COPY jobs/cleanup_disk.xml /usr/share/jenkins/ref/jobs/cleanup_disk/config.xml
COPY jobs/puma-all-features-unit-tests-with-sonar.xml /usr/share/jenkins/ref/jobs/puma-all-features-unit-tests-with-sonar/config.xml
COPY jobs/puma-all-releases-unit-tests-with-sonar.xml /usr/share/jenkins/ref/jobs/puma-all-releases-unit-tests-with-sonar/config.xml
COPY jobs/puma-build-flow-rpm-all.xml /usr/share/jenkins/ref/jobs/puma-build-flow-rpm-all/config.xml
COPY jobs/puma-build-flow.xml /usr/share/jenkins/ref/jobs/puma-build-flow/config.xml
COPY jobs/puma-build-rpm-ansible-integration.xml /usr/share/jenkins/ref/jobs/puma-build-rpm-ansible-integration/config.xml
COPY jobs/puma-build-rpm-component.xml /usr/share/jenkins/ref/jobs/puma-build-rpm-component/config.xml
COPY jobs/puma-build-rpms-ansible.xml /usr/share/jenkins/ref/jobs/puma-build-rpms-ansible/config.xml
COPY jobs/puma-build-rpms-join-artefacts.xml /usr/share/jenkins/ref/jobs/puma-build-rpms-join-artefacts/config.xml
COPY jobs/puma-demo-switch-https-http.xml /usr/share/jenkins/ref/jobs/puma-demo-switch-https-http/config.xml
COPY jobs/puma-develop-behat.xml /usr/share/jenkins/ref/jobs/puma-develop-behat/config.xml
COPY jobs/puma-develop-unit-tests-with-sonar.xml /usr/share/jenkins/ref/jobs/puma-develop-unit-tests-with-sonar/config.xml

############################################
# Configure Jenkins
############################################
# Jenkins settings
COPY config/config.xml /usr/share/jenkins/ref/config.xml

# Jenkins Settings, i.e. Maven, Groovy, ...
COPY config/hudson.tasks.Maven.xml /usr/share/jenkins/ref/hudson.tasks.Maven.xml
COPY config/maven-global-settings-files.xml /usr/share/jenkins/ref/maven-global-settings-files.xml

# SSH Keys & Credentials
COPY config/ssh-keys/cd-demo /usr/share/jenkins/ref/.ssh/id_rsa
COPY config/ssh-keys/cd-demo.pub /usr/share/jenkins/ref/.ssh/id_rsa.pub