FROM alpine:3.14

LABEL version="1.6.5"
LABEL description="ZeroTier One moon as Docker Image"

RUN apk add --no-cache zerotier-one=1.6.5-r0

# ZeroTier relies on UDP port 9993
EXPOSE 9993/udp

COPY start-moon.sh /start-moon.sh

ENTRYPOINT ["/start-moon.sh"]