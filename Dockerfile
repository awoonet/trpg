FROM ruby:3.0.2-alpine

WORKDIR /usr/src/app
RUN apk update && \
  apk add --virtual build-dependencies build-base && \
  apk add postgresql-client postgresql-dev yarn

RUN gem install bundler:2.2.30
RUN bundle config set --local without 'development test'
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

RUN rm -rf ./public/assets
RUN rails assets:precompile
CMD rails server -b 0.0.0.0 -p 3000
