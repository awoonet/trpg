FROM ruby:3.0.2-alpine

WORKDIR /usr/src/app
RUN apk update && apk add --virtual build-dependencies build-base

COPY Gemfile Gemfile.lock ./
RUN bundle config set --local without 'development test'
RUN bundle install

COPY . .
CMD ["rails", "server", "-b", "0.0.0.0"]
