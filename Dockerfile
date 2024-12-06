# Use an official Ruby base image with Alpine Linux to reduce image size
FROM ruby:3.2.6-alpine

# Install system dependencies (including build-base for compiling native gems)
RUN apk add --no-cache \
  build-base \
  nodejs \
  postgresql-client \
  yarn

# Set the working directory
WORKDIR /app

# Copy only the Gemfile and Gemfile.lock to take advantage of Docker's cache
COPY Gemfile Gemfile.lock

# Install the gems (Ruby libraries)
RUN bundle install --jobs=4 --retry=3

# Copy the rest of the source code
COPY . .

# Create a non-root user to run the application
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Expose port 3000
EXPOSE 3000

# Command to start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]