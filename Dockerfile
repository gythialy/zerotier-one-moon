FROM debian:bullseye

LABEL version="1.10.6"
LABEL description="ZeroTier One moon as Docker Image"

RUN apt-get update -qq && apt-get install -y curl gpg sudo \
  iproute2 net-tools iputils-ping openssl libssl1.1 procps ca-certificates; \
  rm -rf /var/lib/apt/lists/*;\
  curl -s https://install.zerotier.com | sudo bash;

# ZeroTier relies on UDP port 9993
EXPOSE 9993/udp

COPY start-moon.sh /start-moon.sh

ENTRYPOINT ["/start-moon.sh"]