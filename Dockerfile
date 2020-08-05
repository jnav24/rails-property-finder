FROM ruby:2-alpine

RUN apt-get update
RUN apt-get install -y --no-install-recommends
RUN mysql-client
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
