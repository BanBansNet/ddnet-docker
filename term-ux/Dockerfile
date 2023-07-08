FROM alpine:3.18.2

ARG CHILLERBOT_VERSION=v0.0.5

WORKDIR chillerbot/

RUN apk add cmake make g++ libpng-dev rust cargo sqlite-dev curl-dev python3

RUN wget -O chillerbot.zip https://github.com/chillerbot/chillerbot-ux/archive/refs/tags/$CHILLERBOT_VERSION.zip

RUN unzip chillerbot.zip
RUN rm chillerbot.zip
RUN mv * chillerbot-src

RUN mkdir chillerbot-src/build
RUN cd chillerbot-src/build && cmake .. -DPREFER_BUNDLED_LIBS=ON -DSERVER=OFF -DHEADLESS_CLIENT=ON -DCURSES_CLIENT=ON && make -j$(nproc)

FROM alpine:3.18.2

WORKDIR chillerbot/

RUN apk add curl

COPY --from=0 /chillerbot/chillerbot-src/build/term-ux .

CMD ["/chillerbot/term-ux"]

