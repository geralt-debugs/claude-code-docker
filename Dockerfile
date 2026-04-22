# Use a Node 18 base image
FROM node:lts

# Create app directory
WORKDIR /app

# Install curl (required for the Claude install script)
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Install Claude Code globally
RUN curl -fsSL https://claude.ai/install.sh | bash

COPY .bashrc /root/.bashrc

ENV PATH="/root/.local/bin:$PATH"
# Set default workdir (optional)
WORKDIR /workspace

# Ensure entrypoint is the Claude Code CLI
ENTRYPOINT ["claude"]
