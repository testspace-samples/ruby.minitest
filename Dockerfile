FROM ruby:2.3.4

RUN apt-get update && apt-get install -y nodejs
RUN mkdir -p /app
WORKDIR /app

RUN gem install bundler

COPY Gemfile Gemfile.lock ./

RUN bundle install

RUN printenv

COPY . ./

RUN curl -fsSL https://testspace-client.s3.amazonaws.com/testspace-linux-dev.tgz | tar -zxvf- -C /usr/local/bin
RUN testspace config url http://e18dc52ec2bceda7689d7e5bfed6791e26d449f8:@open.stridespace.com/
