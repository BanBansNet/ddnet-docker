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

CMD ["/ddnet/DDNet-Server"]

