FROM jupyter/pyspark-notebook:latest

ENV POETRY_VERSION="1.0.5"
ENV VENV_PATH="/home/${NB_USER}/.venv"
ENV PATH="/home/${NB_USER}/.poetry/bin:${VENV_PATH}:$PATH"

USER root

# Install dependencies.
RUN apt-get update --fix-missing \
    && apt-get install -y --no-install-recommends \
        curl \
    && rm -rf /var/lib/apt/lists/*

USER ${NB_USER}

# https://hub.docker.com/r/jupyter/base-notebook/dockerfile
WORKDIR /home/${NB_USER}

# Install a pinned version of poetry
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sSL \
    https://raw.githubusercontent.com/python-poetry/poetry/${POETRY_VERSION}/get-poetry.py | python

# Make sure to install dependencies in a .venv directory
RUN python -m venv $VENV_PATH

COPY pyproject.toml poetry.lock ./

# Install poetry dependencies in the previosly created venv
RUN poetry config virtualenvs.in-project true

# Install python dependencies
# FLAGS:
#   --no-interaction: do not to ask any interactive questions
#   --no-ansi: make output more log-friendly
#   --no-dev: no development dependencies
RUN poetry install --no-interaction --no-ansi --no-dev --no-root

EXPOSE 8888
