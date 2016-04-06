
FROM ruby:2.3.0
MAINTAINER Nina Ball <nina.ball@gmail.com>
 
RUN apt-get update
RUN apt-get -y install git nodejs ruby-dev
RUN git clone https://github.com/FortAwesome/Font-Awesome.git /font-awesome
RUN gem install bundler
RUN gem install npm
RUN npm install -g less
RUN npm install -g less-plugin-clean-css
 
WORKDIR /font-awesome
 
RUN bundle install
RUN npm install
RUN bundle exec jekyll build
 
EXPOSE 7998
#CMD rackup -o 0.0.0.0
CMD bundle exec jekyll -w serve
