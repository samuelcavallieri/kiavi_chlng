FROM ruby:3.2.6-alpine

# Install system dependencies
RUN apk add --no-cache \
  build-base \
  nodejs \
  postgresql-client \
  libc6-compat \
  postgresql-dev \
  bash \
  git \
  yarn \
  linux-headers 

# Set the working directory 
WORKDIR /app 

# Copy the Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install


RUN mkdir -p /app/tmp/cache \
    && chmod -R 777 /app/tmp

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh 
RUN chmod +x /entrypoint.sh

# Configure a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]