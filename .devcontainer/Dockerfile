FROM ruby:2.7.1-buster

ENV DEBIAN_FRONTEND=noninteractive

# ENV BUNDLE_HOME="/usr/local/bundle" \
#     BUNDLE_SILENCE_ROOT_WARNING=1 \
#     BUNDLE_APP_CONFIG="$BUNDLE_HOME"

# ENV JEKYLL_VERSION="4.1.0" \
#     JEKYLL_BIN="/usr/jekyll/bin" \
#     JEKYLL_DATA_DIR="/srv/jekyll" \
#     JEKYLL_ENV="development" \
#     JEKYLL_VAR_DIR="/var/jekyll"

ENV DRAFTS=false
ENV FORCE_POLLING=false
ENV VERBOSE=false

ENV PATH="${JEKYLL_BIN}:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

ENV RUBYOPT=-W0

ARG USERNAME=jekyll
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get clean && apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    && apt-get install -y \
        git vim wget curl \
        sudo \
        less \
        libxml2 \
        nodejs \
        tzdata \
        yarn \
        locales \
        libxslt-dev \
        libxml2-dev \
        zlib1g-dev \
        ruby-nokogiri \
        \
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
        \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
        \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN echo "Europe/Stockholm" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
        \
    && echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen \
    && locale-gen \
        \
    && echo 'LANG="en_US.UTF-8"'>/etc/default/locale \
    && dpkg-reconfigure --frontend=noninteractive locales \
        \
    && /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    TZ=Europe/Stockholm \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US

# RUN mkdir -p $JEKYLL_VAR_DIR $JEKYLL_DATA_DIR $JEKYLL_BIN \

RUN gem update --system \
    && gem install --force bundler \
    && bundle config set system 'true' \
    && gem install jekyll
    # --install-dir $JEKYLL_VAR_DIR \
    #    --bindir $JEKYLL_BIN --version $JEKYLL_VERSION -- --use-system-libraries
    #&& gem install nokogiri \

RUN rm -rf /root/.gem /home/jekyll/.gem
# $BUNDLE_HOME/cache

# RUN chown -R jekyll:jekyll $JEKYLL_DATA_DIR \
#       $JEKYLL_VAR_DIR \
#       $JEKYLL_BIN

COPY Gemfile .

RUN bundle config set system 'true' \
    && bundle install

# COPY --chown=jekyll:jekyll .docker/entrypoint ${JEKYLL_BIN}/entrypoint

# VOLUME  /srv/jekyll
# WORKDIR /srv/jekyll

EXPOSE 35729
EXPOSE 4000

# CMD ["jekyll", "serve", "--livereload", "--incremental", "--force_polling", "--watch", "--host", "0.0.0.0"]
# ENTRYPOINT ["/usr/jekyll/bin/entrypoint"]

ENV DEBIAN_FRONTEND=dialog
