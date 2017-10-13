FROM ruby:2.3.4

RUN apt-get update && apt-get install -y nodejs
RUN mkdir /app
WORKDIR /app

RUN curl -fsSL https://testspace-client.s3.amazonaws.com/testspace-linux-dev.tgz | tar -zxvf- -C /usr/local/bin

RUN printenv
RUN testspace config url e18dc52ec2bceda7689d7e5bfed6791e26d449f8:@open.stridespace.com/

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN gem install bundler
RUN bundle install
COPY . .