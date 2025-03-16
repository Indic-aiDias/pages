# Use a newer Ruby version (3.x)
FROM ruby:3.1

# Install required system dependencies
RUN apt-get update -qq && apt-get install -y build-essential nodejs

# Set the working directory
WORKDIR /usr/src/app

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install Bundler (ensure latest compatible version)
RUN gem install bundler --no-document

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose the Jekyll server port
EXPOSE 4000

# Default command to run Jekyll server
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
