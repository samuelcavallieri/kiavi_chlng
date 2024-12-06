FROM ruby:3.1-alpine

RUN apk add --no-cache \
  build-base \
  nodejs \
  postgresql-client \
  yarn

WORKDIR /app

COPY Gemfile Gemfile.lock

RUN bundle install --jobs=4 --retry=3

COPY . .

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]