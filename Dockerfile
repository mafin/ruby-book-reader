FROM ruby:3.2

# Install Node.js for asset compilation
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs

# Set an environment variable to store where the app is installed to inside
# of the docker image.
ENV INSTALL_PATH /myapp
RUN mkdir -p $INSTALL_PATH

# This sets the context of where commands will be ran in and is documented
# on docker's website extensively.
WORKDIR $INSTALL_PATH

# Ensure gems are cached and only get updated when they change. This will
# drastically increase build times when your gems do not change.
COPY Gemfile Gemfile
#COPY Gemfile.lock Gemfile.lock
RUN bundle install --jobs 20 --retry 5

# Copy in the application code from your work station at the current directory
# over to the working directory.
COPY . .

# Provide dummy data to Rails so it can pre-compile assets.
#RUN bundle exec rake assets:precompile

# The default command that gets ran will be to start the Rails server.
CMD bundle exec rails s -p 3000 -b '0.0.0.0'
