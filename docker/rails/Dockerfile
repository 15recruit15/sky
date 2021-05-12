FROM ruby:2.6.3 

ENV DOCKERIZE_VERSION v0.6.1
RUN apt-get update -qq && \
    apt-get install -y build-essential mariadb-client nodejs build-essential  wget &&\
    wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz &&\
    tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz &&\
    rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz &&\
    apt clean
                             
RUN mkdir /myproject
ENV APP_ROOT /myproject
WORKDIR $APP_ROOT
COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock
RUN bundle install
COPY . $APP_ROOT