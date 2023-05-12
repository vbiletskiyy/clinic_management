FROM ruby:3.1.2

RUN curl https://deb.nodesource.com/setup_19.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn

RUN apt-get update && apt-get install -y vim

ENV PATH="/usr/local/bundle/bin:${PATH}"

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . /app

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
