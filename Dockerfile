
FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

WORKDIR /app

ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright \
    UV_LINK_MODE=copy \
    UV_CACHE_DIR=/tmp/uv-cache \
    HOME=/home/pipeline \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

RUN useradd --system --create-home --shell /usr/sbin/nologin pipeline

# Install locked dependencies before copying application code,
# allowing Docker to cache this layer when the code changes.
COPY pyproject.toml uv.lock README.md ./

RUN uv sync --locked --no-install-project

# Install Chromium and its OS-level dependencies as root.
RUN uv run --no-sync playwright install --with-deps chromium \
    && chmod -R a+rX /ms-playwright \
    && rm -rf /var/lib/apt/lists/*

COPY --chown=pipeline:pipeline manexp_data ./manexp_data

RUN uv sync --locked \
    && rm -rf /tmp/uv-cache \
    && chown -R pipeline:pipeline /app

USER pipeline

CMD ["uv", "run", "--no-sync", "python", "-m", "manexp_data.run"]
