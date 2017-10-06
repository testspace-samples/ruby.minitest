FROM ruby:2.3.4

RUN apt-get update && apt-get install -y nodejs curl
RUN mkdir /app
WORKDIR /app

RUN curl -fsSL https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | tar -zxvf- -C /usr/local/bin
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN gem install bundler
RUN bundle install
COPY . .