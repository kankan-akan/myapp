FROM ruby:3.0.3

ARG WORKDIR

ENV RAILS_ENV=production
ENV HOME=/${WORKDIR} \
        LANG=C.UTF-8 \
        TZ=Asia/Tokyo

RUN echo ${HOME}

WORKDIR ${HOME}

COPY Gemfile* ./

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
        && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq
RUN apt-get install -y nodejs yarn
RUN /usr/bin/mysql*
RUN bundle install -j4
# RUN gem install rails

COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]