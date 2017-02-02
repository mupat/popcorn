FROM ruby:2.4.0

MAINTAINER Mupat <dev@mupat.net>

# RUN apt-get update \
#     && apt-get install -y \
#       qt5-default \
#       libqt5webkit5-dev \
#       gstreamer1.0-plugins-base \
#       gstreamer1.0-tools \
#       gstreamer1.0-x \
#       xvfb \
#       postgresql-client \
#       ffmpegthumbnailer \
#     && rm -rf /var/lib/apt/lists/*

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

WORKDIR /app
COPY Gemfile* ./
RUN gem install bundler && bundle install
COPY . ./

#RUN bundle exec rake assets:precompile

ENTRYPOINT ["bundle", "exec"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
