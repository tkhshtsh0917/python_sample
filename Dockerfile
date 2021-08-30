FROM python:3.8-slim as base

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_HOME="/opt/poetry" \
    POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_CREATE=false \
    PYSETUP_PATH="/opt/setup"
ENV PATH="$POETRY_HOME/bin:$PATH"

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        curl \
        build-essential \
    && rm -rf ~/.cache \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/*  
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

WORKDIR $PYSETUP_PATH


FROM base as builder

COPY poetry.lock pyproject.toml ./

RUN poetry install --no-dev \
    && rm -rf ~/.cache


FROM base as production

COPY --from=builder /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
COPY ./sample /app/sample

WORKDIR /app

ENTRYPOINT [ "python", "-m", "sample" ]
