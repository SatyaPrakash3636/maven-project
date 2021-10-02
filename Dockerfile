FROM jenkins/jenkins

USER root

RUN apt update -y

RUN apt install software-properties-common -y

RUN apt-get install python3-distutils -y

RUN apt -y install python3

RUN curl -O https://bootstrap.pypa.io/get-pip.py

RUN python3 get-pip.py

RUN pip3 install ansible --upgrade

RUN apt-get update -y

RUN apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

RUN echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update -y

RUN apt-get -y install docker-ce

RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

RUN chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker jenkins

USER jenkins
