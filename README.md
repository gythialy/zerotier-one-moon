# zerotier-one-moon
🐳 A docker image to create ZeroTier moon in one step.

## Docker

```bash
docker run -d \
  --cap-add=NET_ADMIN --cap-add=SYS_ADMIN \
  --device=/dev/net/tun \
  --name zerotier-moon \
  --restart unless-stopped \
  -p 9993:9993/udp \
  -v zerotier-one:/var/lib/zerotier-one \
  ghcr.io/gythialy/zerotier-one-moon:latest -4 xxx.xxx.xxx.xxx
```

## Docker-compose 

```yaml
version: "3.5"

services:
  zerotier-moon:
    image: ghcr.io/gythialy/zerotier-one-moon:latest
    container_name: zerotier-moon
    cap_add:
      - NET_ADMIN
      - SYS_ADMIN
    devices:
      - /dev/net/tun
    ports:
      - 9993:9993/udp
    command:
      - -4 xxx.xxx.xxx.xxx
      - -p 9993
    volumes:
      - ./zerotier-one:/var/lib/zerotier-one
```

`-4 xxx.xxx.xxx.xxx` to set public IP.

Once set up successfully, the log should be like this

```
IPv4 address: xxx.xxx.xxx.xxx
stableEndpoints: "xxx.xxx.xxx.xxx\/9993"
Your ZeroTier moon id is 61941d46d1, you could orbit moon using "zerotier-cli orbit 61941d46d1 61941d46d1"
```