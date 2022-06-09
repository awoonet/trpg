FROM ruby:3.0.2-alpine

WORKDIR /usr/src/app
RUN apk update && \
  apk add --virtual build-dependencies build-base && \
  apk add postgresql-client postgresql-dev

COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.2.30
RUN bundle config set --local without 'development test'
RUN bundle install

COPY . .

RUN rails assets:precompile
CMD rails server
