FROM ruby:alpine
# Minimal requirements for Rails
RUN apk update && apk add --no-cache --update build-base \
                                autoconf automake libtool pkgconfig \
                                postgresql postgresql-dev \
                                linux-headers \
                                git \
                                nodejs \
                                tzdata
RUN gem install bundler
ENV APP_PATH /usr/src/app
WORKDIR $APP_PATH
RUN apk update && apk add --no-cache --update yarn

COPY Gemfile* yarn.lock package.json $APP_PATH/
RUN bundle install --jobs 4 --retry 3 --deployment --without development test

COPY . $APP_PATH

RUN yarn
RUN RAILS_ENV=production bin/rake assets:precompile

ENV RAILS_SERVE_STATIC_FILES 1
EXPOSE 3000
CMD bin/rake db:migrate && bin/puma -C config/puma.rb

CMD ["/bin/sh"]