# Basic gitlab-ci-runner Image

FROM        ubuntu:12.04
MAINTAINER  pgolm "golm.peter@gmail.com"


# apt-get deps

RUN         apt-get update -y
RUN         apt-get install -y -q sudo wget git build-essential libicu-dev lsb-release python-software-properties
RUN 		add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"

# install ruby 1.9.3, bundler

RUN         wget -O ruby-install-0.1.4.tar.gz https://github.com/postmodern/ruby-install/archive/v0.1.4.tar.gz
RUN         tar -xzvf ruby-install-0.1.4.tar.gz
RUN         ruby-install-0.1.4/bin/ruby-install -i /usr/local/ ruby 1.9.3 
RUN         rm -rf ruby-install-0.1.4/ ruby-install-0.1.4.tar.gz
RUN         gem install bundler

# install gitlab-ci-runner

RUN         git clone https://github.com/gitlabhq/gitlab-ci-runner.git gitlab-ci-runner
RUN         cd gitlab-ci-runner && bundle install 

# ssh
RUN 		mkdir -p /root/.ssh
RUN 		touch /root/.ssh/known_hosts
ENV			HOME /root