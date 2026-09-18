# #!/bin/bash

# set -euxo pipefail

# ###############################################
# # SYSTEM UPDATE
# ###############################################

# sudo apt-get update -y
# sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y


# ###############################################
# # BASIC PACKAGES
# ###############################################

# sudo apt-get install -y \
#     wget \
#     curl \
#     gnupg \
#     ca-certificates \
#     unzip \
#     tar \
#     git \
#     gcc \
#     make \
#     software-properties-common \
#     apt-transport-https


# ###############################################
# # JAVA 21
# ###############################################

# sudo apt-get install -y openjdk-21-jdk

# sudo update-alternatives --display java

# sudo update-alternatives --set java \
#     /usr/lib/jvm/java-21-openjdk-amd64/bin/java

# java -version


# ###############################################
# # JENKINS
# ###############################################

# sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
#     https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

# echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
# https://pkg.jenkins.io/debian-stable binary/" \
# | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# sudo apt-get update -y

# sudo apt-get install -y jenkins

# sudo systemctl daemon-reload
# sudo systemctl enable jenkins
# sudo systemctl start jenkins

# sudo systemctl is-active jenkins


# ###############################################
# # NODE.JS
# ###############################################

# # Install Node.js 22 LTS
# curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -

# sudo apt-get install -y nodejs

# node --version
# npm --version


# ###############################################
# # GITLEAKS
# ###############################################

# GITLEAKS_VERSION="8.28.0"

# curl -fsSLO \
# "https://github.com/gitleaks/gitleaks/releases/download/v${GITLEAKS_VERSION}/gitleaks_${GITLEAKS_VERSION}_linux_x64.tar.gz"

# tar -xzf \
# "gitleaks_${GITLEAKS_VERSION}_linux_x64.tar.gz"

# sudo mv gitleaks /usr/local/bin/gitleaks

# sudo chmod +x /usr/local/bin/gitleaks

# rm -f "gitleaks_${GITLEAKS_VERSION}_linux_x64.tar.gz"

# gitleaks version


# ###############################################
# # TRIVY
# ###############################################

# curl -sfL \
# https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh \
# | sudo sh -s -- -b /usr/local/bin

# trivy --version


# ###############################################
# # TRIVY HTML TEMPLATE
# ###############################################

# sudo mkdir -p /usr/local/share/trivy/templates

# sudo curl -L \
# https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/html.tpl \
# -o /usr/local/share/trivy/templates/html.tpl

# sudo chmod 644 /usr/local/share/trivy/templates/html.tpl


# ###############################################
# # DOCKER
# ###############################################

# sudo apt-get install -y docker.io

# sudo systemctl enable docker
# sudo systemctl start docker

# sudo usermod -aG docker jenkins

# # If the VM user is azureuser
# if id "azureuser" >/dev/null 2>&1; then
#     sudo usermod -aG docker azureuser
# fi

# docker --version


# ###############################################
# # GIT
# ###############################################

# sudo apt-get install -y git

# git --version


# ###############################################
# # PYTHON 3.11
# ###############################################

# sudo apt-get update -y

# sudo apt-get install -y \
#     python3 \
#     python3-pip \
#     python3-venv \
#     python3-dev \
#     gcc

# python3 --version
# pip3 --version

# ###############################################
# # PYTHON VIRTUAL ENVIRONMENT
# ###############################################

# sudo -u jenkins python3.11 -m venv /var/lib/jenkins/venv311

# sudo -u jenkins /var/lib/jenkins/venv311/bin/python \
#     --version

# sudo -u jenkins /var/lib/jenkins/venv311/bin/pip \
#     --version


# ###############################################
# # JENKINS DIRECTORY PERMISSIONS
# ###############################################

# sudo chown -R jenkins:jenkins /var/lib/jenkins


# ###############################################
# # RESTART JENKINS
# ###############################################

# sudo systemctl restart jenkins

# sudo systemctl is-active jenkins


# ###############################################
# # VERIFY INSTALLATIONS
# ###############################################

# echo "======================================"
# echo "Bootstrap completed successfully!"
# echo "======================================"

# echo "Java:"
# java -version

# echo "Node:"
# node --version

# echo "NPM:"
# npm --version

# echo "Git:"
# git --version

# echo "Trivy:"
# trivy --version

# echo "Gitleaks:"
# gitleaks version

# echo "Docker:"
# docker --version

# echo "Python:"
# python3.11 --version

# echo "Jenkins:"
# sudo systemctl status jenkins --no-pager