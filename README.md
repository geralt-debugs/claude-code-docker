# Claude Code Docker

Claude code collects a large amount of data from the running machine(apart from the current repository data). It also fingerprints the machine. To get back control, users can use this simple dockerfile to run claude code in a container. This way the machine hardware params can be spoofed(upto a certain extent), and it will become difficult to fingerprint users/machines.

Run [Claude Code](https://claude.ai/code) in a Docker container, with your workspace and Claude config mounted from the host.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed and running
- Claude Code authenticated on your host (`~/.claude` and `~/.claude.json` must exist)

## Build

```bash
docker build -t claude-code-docker .
```

or you can skip and just use `geraltdebugs/claude-code-docker` if you dont want to build and want a quick start

## Run

```bash
docker run -it --rm \
  -v "$PWD":/workspace \
  -v "$HOME/.claude":/root/.claude \
  -v "$HOME/.claude.json":/root/.claude.json \
  claude-code-docker
```

or

```bash
docker run -it --rm \
  -v "$PWD":/workspace \
  -v "$HOME/.claude":/root/.claude \
  -v "$HOME/.claude.json":/root/.claude.json \
  geraltdebugs/claude-code-docker
```

This mounts:

- `$PWD` — your current project directory into `/workspace`
- `~/.claude` — your Claude config/settings directory
- `~/.claude.json` — your Claude authentication file

## Alias (optional)

If you're happy with the setup, add this alias to your shell config (`~/.bashrc`, `~/.zshrc`, etc.) to replace the `claude` command:

```bash
alias claude='docker run -it --rm \
  -v "$PWD":/workspace \
  -v "$HOME/.claude":/root/.claude \
  -v "$HOME/.claude.json":/root/.claude.json \
  claude-code-docker'
```

Then reload your shell:

```bash
source ~/.bashrc  # or source ~/.zshrc
```

Now `claude` will run the containerized version transparently.
