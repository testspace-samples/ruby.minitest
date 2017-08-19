FROM ruby:2.3.4

RUN apt-get update && apt-get install -y nodejs
RUN mkdir /app
WORKDIR /app

ENV HOME /home
ENV PATH /home/bin:$PATH

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN gem install bundler
RUN bundle install
COPY . .