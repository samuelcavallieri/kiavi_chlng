# Use an official Ruby base image with Alpine Linux
FROM ruby:3.2.6-alpine

# Install system dependencies
RUN apk add --no-cache \
  build-base \
  nodejs \
  postgresql-client \
  postgresql-dev \  
  libc6-compat      

# Set working directory
WORKDIR /app

# Copy the rest of the source code
COPY . .

# Add gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Initialize PostgreSQL and create the 'spina_app' database
RUN su postgres -c 'initdb -D /var/lib/postgresql/data' && \
    su postgres -c 'pg_ctl -D /var/lib/postgresql/data -l logfile start' && \
    sleep 5 && \
    psql -U postgres -c 'CREATE DATABASE spina_app;'

# Configure a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Expose the port
EXPOSE 3000

# Start the server
CMD ["rails", "server", "-b", "0.0.0.0"]