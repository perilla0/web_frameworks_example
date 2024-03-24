# https://hub.docker.com/_/ruby
# https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/rails/

ARG RUBY_VERSION=""

FROM ruby:${RUBY_VERSION}

ARG RAILS_VERSION=""
ARG RAILS_NEW_OPTION=""

# ビルド用ディレクトリ
RUN mkdir -p /build/rails/${RAILS_VERSION} && chmod -R 0777 /build/rails/${RAILS_VERSION}
WORKDIR /build/rails/${RAILS_VERSION}

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

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000