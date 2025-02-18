FROM ruby:3.1

RUN apt-get update -qq && \
    apt-get install -y \
    libgl1-mesa-glx \
    libglu1-mesa \
    libx11-dev \
    libsndfile1 \
    libsdl2-dev \
    libfreetype6 \
    libfontconfig1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD ["ruby", "app.rb"]
