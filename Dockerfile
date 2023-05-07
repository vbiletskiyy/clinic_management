FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

ENV PATH="/usr/local/bundle/bin:${PATH}"

WORKDIR /app

COPY Gemfile* /app/

RUN bundle install

COPY . /app

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

