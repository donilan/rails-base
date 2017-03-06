FROM ruby:2.3.3
COPY config/sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -qq -y --force-yes build-essential nodejs libpq-dev postgresql-client-9.4 --fix-missing --no-install-recommends
RUN apt-get clean

COPY bin/entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

RUN mkdir -p /app

WORKDIR /app

RUN echo "gem: --no-idoc --no-document --no-ri" > $HOME/.gemrc
RUN gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/


RUN gem install bundler
RUN gem install rails
RUN gem install sass-rails
RUN gem install coffee-rails
RUN gem install jquery-rails
RUN gem install turbolinks
RUN gem install jbuilder
RUN gem install pg
RUN gem install thin
RUN gem install devise
RUN gem install hamlit-rails
RUN gem install bootstrap-sass
RUN gem install font-awesome-rails
RUN gem install kaminari

COPY Gemfile /app/
COPY Gemfile.lock /app/
RUN bundle install --without test development
COPY . /app
COPY ./config/local_env.yml.sample /app/config/local_env.yml


EXPOSE 3000
ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["start"]
