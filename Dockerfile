FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /instagram
WORKDIR /instagram
COPY Gemfile /instagram/Gemfile
COPY Gemfile.lock /instagram/Gemfile.lock
# RUN install bundler
RUN bundle install
COPY . /instagram

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]