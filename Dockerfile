FROM ruby:2.7.0
MAINTAINER jjs276@gmail.com

RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs

RUN gem install bundle

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

COPY . /app

EXPOSE 4000

CMD [ "bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "4000"]
