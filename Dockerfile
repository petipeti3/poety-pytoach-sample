FROM debian:bullseye-slim

# 必要な依存パッケージをインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev \
    python3-openssl \
    make \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# pyenvのインストール
RUN curl https://pyenv.run | bash

# pyenvとpoetryの環境変数を設定
ENV PYENV_ROOT="/root/.pyenv"
ENV PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"

# pyenvを初期化し、Python 3.9.xをインストール (poetryの設定に合わせる)
RUN pyenv install 3.9.18 && pyenv global 3.9.18

# poetryのインストール
RUN curl -sSL https://install.python-poetry.org | python3 -

# poetryのパスを設定
ENV PATH="/root/.local/bin:$PATH"

# 作業ディレクトリを設定
WORKDIR /app

# pyproject.toml と poetry.lock をコピー
COPY pyproject.toml poetry.lock* /app/

# 依存関係のインストール
RUN poetry install --no-root

# アプリケーションファイルをコピー
COPY . /app

# 実行コマンドの設定
CMD ["poetry", "run", "python", "src/main.py"]

