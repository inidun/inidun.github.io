FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV BUNDLE_HOME=/usr/local/bundle

ARG USERNAME=jekyll
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    && apt-get install -y \
        git vim wget curl \
        make \
		build-essential \
		ruby \
        ruby-dev \
    && gem install \
        bundler \
        jekyll \
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get install -y sudo \
        less \
        libxml2 \
        nodejs \
        tzdata \
        yarn \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p $BUNDLE_HOME \
    && chown -R jekyll:jekyll $BUNDLE_HOME \
    && rm -rf $BUNDLE_HOME/cache

RUN apt-get update \
    && apt-get install -y libxslt-dev libxml2-dev zlib1g-dev

RUN gem install nokogiri

RUN apt-get install -y locales

#RUN dpkg-reconfigure locales && locale-gen C.UTF-8 && /usr/sbin/update-locale LANG=C.UTF-8

RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && locale-gen

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

COPY Gemfile* .

RUN bundle install

ENV DEBIAN_FRONTEND=dialog
