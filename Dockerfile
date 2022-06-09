FROM ruby:3.0.2-slim-buster

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle config set --local without 'development test'
RUN bundle install --without x86_64-linux

CMD ["rails", "server", "-b", "0.0.0.0"]
