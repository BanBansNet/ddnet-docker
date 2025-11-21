FROM alpine:3.18.2

ARG DDNET_INSTA_VERSION=v1.7

WORKDIR /ddnet

RUN apk add cmake make g++ libpng-dev rust cargo mysql-dev sqlite-dev curl-dev python3

RUN wget -O ddnet.zip https://github.com/ddnet-insta/ddnet-insta/archive/refs/tags/$DDNET_INSTA_VERSION.zip

RUN unzip ddnet.zip
RUN rm ddnet.zip
RUN mv * ddnet-src

RUN mkdir ddnet-src/build
RUN cd ddnet-src/build && cmake .. -DPREFER_BUNDLED_LIBS=ON -DCLIENT=OFF -DMYSQL=ON && make -j$(nproc)

FROM alpine:3.18.2

WORKDIR /ddnet

RUN apk add mysql-dev sqlite-dev curl

COPY --from=0 /ddnet/ddnet-src/build/DDNet-Server .

RUN mkdir maps

RUN wget -O "maps/Sunny Side Up.map" https://github.com/ddnet/ddnet-maps/raw/62f31034aef0e17050749fe615a652985ad91f10/types/novice/maps/Sunny%20Side%20Up.map

CMD ["/ddnet/DDNet-Server"]

