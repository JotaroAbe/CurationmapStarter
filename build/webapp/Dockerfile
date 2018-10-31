FROM ubuntu:18.04
MAINTAINER usagiramen

# apt update
RUN apt-get update
RUN apt-get install -y sudo

# add sudo user
RUN groupadd -g 1000 developer && \
    useradd  -g      developer -G sudo -m -s /bin/bash usagi && \
    echo 'usagi:hogehoge' | chpasswd

RUN echo 'Defaults visiblepw'             >> /etc/sudoers
RUN echo 'usagi ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER usagi
WORKDIR /home/usagi

#install tools
RUN sudo apt-get install -y openjdk-11-jdk wget gnupg git npm

#install sbt
RUN echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN sudo apt-get update
RUN sudo apt-get install -y sbt

#git clone
RUN sudo git clone --recursive https://github.com/JotaroAbe/CurationmapGenerator.git

#change chown
RUN sudo chown -R usagi:developer ~/

#compile typescripts
WORKDIR /home/usagi/CurationmapGenerator/public/javascripts
RUN npm install
RUN npm run build

#move cd
WORKDIR /home/usagi/CurationmapGenerator

#loadSbtDep
RUN sbt compile

#language jp
RUN sudo apt-get -y install language-pack-ja-base language-pack-ja
RUN sudo locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
ENV LC_ALL=ja_JP.UTF-8
ENV LC_CTYPE=ja_JP.UTF-8