FROM ruby:3.1.2

ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo



RUN apt-get update; \
    apt-get install -y --no-install-recommends \
		mariadb-client tzdata

RUN mkdir -p /backend
ARG ROOT=/backend
WORKDIR ${ROOT}


COPY Gemfile ${ROOT}
COPY Gemfile.lock ${ROOT}

RUN gem install bundler && \
    bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]