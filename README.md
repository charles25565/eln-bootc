# eln-bootc

[![CI/CD](https://github.com/charles25565/eln-bootc/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/charles25565/eln-bootc/actions/workflows/ci-cd.yml)

Fedora ELN bootc images. These can be used like any other.

## Using

Use the container URL: [`ghcr.io/charles25565/eln-bootc`](https://ghcr.io/charles25565/eln-bootc)

## Building

```bash
sudo podman build --security-opt=label=disable --cap-add=all --device /dev/fuse -t localhost/eln-bootc:latest .
```
