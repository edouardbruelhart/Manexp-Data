
FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

WORKDIR /app

ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright \
    UV_LINK_MODE=copy \
    HOME=/home/pipeline

RUN useradd --system --create-home --shell /usr/sbin/nologin pipeline

COPY pyproject.toml uv.lock README.md ./

RUN uv sync --locked --no-install-project

RUN uv run playwright install --with-deps chromium \
    && chmod -R a+rX /ms-playwright \
    && rm -rf /var/lib/apt/lists/*

COPY --chown=pipeline:pipeline manexp_data ./manexp_data

USER pipeline

CMD ["uv", "run", "manexp_data/run.py"]
