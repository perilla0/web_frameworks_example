# https://hub.docker.com/_/ruby
# https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/rails/

ARG RUBY_VERSION=""

FROM ruby:${RUBY_VERSION}

ARG EX_ENV=""
ARG RAILS_VERSION=""
ARG RAILS_NEW_OPTION=""

# ビルド用ディレクトリ
WORKDIR /build/rails/${RAILS_VERSION}
RUN chmod -R 0777 .

# https://bundler.io/guides/gemfile.html
# https://rubygems.org/gems/rails?locale=ja
# Railsプロジェクトを作成し、Gemfileをbundle installする
# /script/init/create_src.shのrails newとオプションを合わせる
RUN touch Gemfile \
    && touch Gemfile.lock \
    && echo -n " \n\
    source 'https://rubygems.org' \n\
    gem 'rails', '${RAILS_VERSION}'\n\
    " > Gemfile \
    && bundle install \
    && rails _${RAILS_VERSION}_ new src --skip-bundle --skip ${RAILS_NEW_OPTION} 

# 生成したrailsプロジェクトのGemfileを使用してbundle install
WORKDIR /build/rails/${RAILS_VERSION}/src
RUN bundle install

WORKDIR /app/src
RUN chmod -R 0777 .

# プロジェクトフォルダ作成済みで、Gemfileが存在する
ADD ./src  .
RUN if [ -f Gemfile ]; then \
        bundle install; \
    fi;

COPY ./env/${EX_ENV}/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000