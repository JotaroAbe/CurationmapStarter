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
RUN sudo apt-get install -y openjdk-11-jdk wget gnupg git mecab libmecab-dev mecab-ipadic-utf8 make curl xz-utils file

#install neologd
ADD NEologd.sh /home/usagi/NEologd.sh
ADD NEologdExpect /home/usagi/NEologdExpect
RUN sudo chmod 777 NEologd.sh && sudo chmod 777 NEologdExpect && ./NEologd.sh

RUN sudo mkdir -p /usr/local/lib/mecab/dic/
RUN sudo cp -r /usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd/ /usr/local/lib/mecab/dic/
RUN sudo mv /usr/local/lib/mecab/dic/mecab-ipadic-neologd/ /usr/local/lib/mecab/dic/ipadic/


#install sbt
RUN echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN sudo apt-get update
RUN sudo apt-get install -y sbt


#change chown
RUN sudo chown -R usagi:developer ~/

#move cd
WORKDIR /home/usagi/CurationmapFactory

#language jp
RUN sudo apt-get -y install language-pack-ja-base language-pack-ja
RUN sudo locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
ENV LC_ALL=ja_JP.UTF-8
ENV LC_CTYPE=ja_JP.UTF-8
