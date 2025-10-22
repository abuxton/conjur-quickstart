FROM cyberark/conjur:1.21.1-arm64
# RUN
# cat /etc/os-release

RUN apt-get update \
 && apt-get install -y sudo curl jq

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER root

# this is where I was running into problems with the other approaches
RUN sudo apt-get update
WORKDIR /root
RUN curl -LO https://github.com/cyberark/conjur-cli-go/releases/download/v8.1.3/conjur-cli_8.1.3_arm64.deb
RUN  sudo dpkg -i ./conjur-cli_8.1.3_arm64.deb
# tar -xvf conjur-cli-go_8.0.1_<version>.tar.gz dpkg -i ./conjur-cli_8.1.3_arm64.deb \n\
# chmod +x conjur \n\
# sudo mv conjur /usr/local/bin \n\
# PATH="/path/to/conjur/cli:$PATH" \n\
