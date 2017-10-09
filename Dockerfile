FROM ruby:2.3.4

RUN apt-get update && apt-get install -y nodejs
RUN mkdir -p /app
WORKDIR /app

RUN curl -fsSL https://testspace-client.s3.amazonaws.com/testspace-linux-dev.tgz | tar -zxvf- -C /usr/local/bin

COPY . ./

RUN gem install bundler
RUN bundle install

RUN printenv
RUN ls -la
RUN git ls-remote .
RUN git symbolic-ref --short 555caf46466063d03b1bd6084374ad634dca5308
RUN testspace config url 06672ad55f6e63bbc07fc87cf33c9225d1407ace:@samples.testspace.com CI=true CI_NAME=codeship
