# Dockerfile for production ddnet servers

```bash
podman build -f Dockerfile -t ddnet
podman run -it ddnet
```

```bash
podman build -t docker.io/chillerdragon/ddnet-simple:17.0.3 -f ddnet-simple/Dockerfile
podman push docker.io/chillerdragon/ddnet-simple:17.0.3
```

