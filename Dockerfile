From ruby:2.3.3
MAINTAINER Adam Dehnel <adam.dehnel@biworldwide.com>

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y bundler nodejs curl git build-essential ruby1.9.1 libsqlite3-dev

RUN gem install \
  github-pages \
  rubygems-update --no-ri --no-rdoc

RUN update_rubygems
RUN gem install bundler --no-ri --no-rdoc

#Copy over the gemfile to a temporary directory and run the install command. 
WORKDIR /src
ADD Gemfile Gemfile
# ADD Gemfile.lock Gemfile.lock 
RUN bundle install
 
# #Switch into the working directory and run the server. 
WORKDIR /src
ENTRYPOINT ["/bin/sh", "-c"] 
CMD ["bundle exec jekyll serve --port 4001 --host 0.0.0.0"]
