FROM ruby:2.6
LABEL maintainer="charaton@icloud.com"

# Allow apt to work with https-based sources
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  apt-transport-https

# Ensure we install an up-to-date version of Node
# See https://github.com/yarnpkg/yarn/issues/2888
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

# Ensure latest packages for Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install packages
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs \
  yarn \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/core_connection
COPY Gemfile Gemfile.lock /usr/src/core_connection/

RUN bundle install

COPY . /usr/src/core_connection/

ENTRYPOINT [ "./docker-entrypoint.sh" ]
CMD [ "bin/rails", "server", "--binding=0.0.0.0" ]
