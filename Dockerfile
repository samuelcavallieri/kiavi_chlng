FROM ruby:3.2.6-alpine

# Install system dependencies
RUN apk add --no-cache \
  build-base \
  nodejs \
  postgresql-client \
  libc6-compat \
  postgresql-dev

# Set the working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the entrypoint script and fix potential line-ending issues
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh \
    && sed -i 's/\r$//' /entrypoint.sh

# Create a non-root user (appuser)
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Expose port 3000
EXPOSE 3000

# Set the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]