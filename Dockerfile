FROM ruby:2.4.0

MAINTAINER Mupat <dev@mupat.net>

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    RAILS_ROOT=/popcorn

WORKDIR $RAILS_ROOT

RUN gem install bundler && gem install rails

COPY . ./

ENV BUNDLE_GEMFILE=$RAILS_ROOT/Gemfile \
    BUNDLE_JOBS=2 \
    BUNDLE_PATH=./vendor/bundle

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
