FROM ruby:2.6.3

ENV DOCKERIZE_VERSION 0.6.1
ENV BUNDLER_VERSION 2.1.4

# build-essentialをインストール
RUN apt-get update　&& apt-get install -y build-essential

#yarn をインストール
RUN apt-get install -y  curl apt-transport-https wget \
 && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -  \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get install -y yarn

# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -\
 && apt-get install -y nodejs

#dockerizeをインストール
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*
                             
RUN mkdir /myproject
ENV APP_ROOT /myproject
WORKDIR $APP_ROOT
COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock
COPY . $APP_ROOT
RUN gem install bundler -v "2.1.4"
RUN bundle install