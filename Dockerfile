
FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

WORKDIR /app

ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

COPY pyproject.toml uv.lock README.md ./

RUN uv sync --locked --no-install-project

RUN uv run playwright install --with-deps chromium \
    && chmod -R a+rX /ms-playwright

COPY manexp_data ./manexp_data

RUN useradd --system --create-home --shell /usr/sbin/nologin pipeline \
    && chown -R pipeline:pipeline /app

ENV HOME=/home/pipeline
USER pipeline

CMD ["uv", "run", "manexp_data/run.py"]
