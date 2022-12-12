FROM ruby:3.0.0-buster

## Create deployer user
RUN apt-get update && \
  apt-get -y install sudo
RUN sudo useradd -m -d /home/deploy -s /bin/bash deploy \
  && echo "deploy:deploy" | chpasswd && adduser deploy sudo

## Installing system dependencies
RUN set -eux; \
  apt-get update; \
  apt-get install -y ssh \
                     build-essential \
                     cmake \
                     pkg-config \
                     postgresql-client;

## Setting up dir
RUN mkdir /home/deploy/app
WORKDIR /home/deploy/app

## Install Ruby dependencies
COPY Gemfile* ./
RUN gem install bundler:1.17.3
RUN bundle install

## Config files
RUN make copy_config

EXPOSE 9292

CMD ["rackup"]
