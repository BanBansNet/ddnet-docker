FROM alpine:3.18.2

WORKDIR /ddnet

RUN apk add cmake make g++ libpng-dev rust cargo sqlite-dev curl-dev python3

RUN wget -O ddnet.zip https://github.com/ddnet/ddnet/archive/refs/tags/17.0.3.zip

RUN unzip ddnet.zip
RUN rm ddnet.zip
RUN mv * ddnet-src

RUN mkdir ddnet-src/build
RUN cd ddnet-src/build && cmake .. -DPREFER_BUNDLED_LIBS=ON -DCLIENT=OFF && make -j$(nproc)

FROM alpine:3.18.2

WORKDIR /ddnet

RUN apk add sqlite-dev curl

COPY --from=0 /ddnet/ddnet-src/build/DDNet-Server .

RUN mkdir maps

RUN wget -O "maps/Sunny Side Up.map" https://github.com/ddnet/ddnet-maps/raw/62f31034aef0e17050749fe615a652985ad91f10/types/novice/maps/Sunny%20Side%20Up.map

CMD ["/ddnet/DDNet-Server"]

