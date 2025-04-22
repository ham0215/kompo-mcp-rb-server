FROM ruby:3.4.3

# Install dependencies
RUN apt-get update && apt-get install -y \
  git \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  libyaml-dev \
  libgmp-dev \
  libreadline-dev \
  pkg-config \
  autoconf \
  bison \
  curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install latest Rust using rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app/

# Install bundler and dependencies
RUN gem install bundler \
  && bundle install

# Set environment variables
ENV KOMPO_CLI=/app/kompo-vfs/target/release/kompo-cli
ENV LIB_KOMPO_DIR=/app/kompo-vfs/target/release
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

CMD ["tail", "-f", "/dev/null"]
