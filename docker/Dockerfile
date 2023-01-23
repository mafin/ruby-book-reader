FROM ruby:3.2

# Install Node.js for asset compilation
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs

# Set an environment variable to store where the app is installed to inside
# of the Docker image.
ENV INSTALL_PATH /myapp
RUN mkdir -p $INSTALL_PATH

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR $INSTALL_PATH

RUN gem install rails

# The default command that gets ran will be to start the Rails server.
CMD ["rails", "new", "book_reader", "--skip-bundle"]
