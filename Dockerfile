
FROM cloudgear/ruby:2.2
MAINTAINER Nina Ball <nina.ball@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install git nodejs ruby-dev build-essential npm locales
RUN git clone https://github.com/FortAwesome/Font-Awesome.git /font-awesome
RUN gem install bundler
RUN npm install -g less
RUN npm install -g less-plugin-clean-css

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8

WORKDIR /font-awesome
 
RUN bundle install
RUN npm install
RUN bundle exec jekyll build
 
EXPOSE 7998
#CMD rackup -o 0.0.0.0
CMD bundle exec jekyll -w serve --trace
