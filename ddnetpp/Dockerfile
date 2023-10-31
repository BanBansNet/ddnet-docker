FROM alpine:3.18.2

ARG DDNETPP_VERSION=v0.1.0

WORKDIR /ddnetpp

RUN apk add cmake make g++ libpng-dev rust cargo sqlite-dev curl-dev python3

RUN wget -O ddnetpp.zip https://github.com/DDNetPP/DDNetPP/archive/refs/tags/$DDNETPP_VERSION.zip

RUN unzip ddnetpp.zip
RUN rm ddnetpp.zip
RUN mv * ddnetpp-src

RUN mkdir ddnetpp-src/build
RUN cd ddnetpp-src/build && cmake .. -DPREFER_BUNDLED_LIBS=ON -DCLIENT=OFF && make -j$(nproc)

FROM alpine:3.18.2

WORKDIR ddnetpp/

RUN apk add sqlite-dev curl

COPY --from=0 /ddnetpp/ddnetpp-src/build/DDNet-Server .

RUN mkdir maps

# BlmapChill v0183
RUN wget -O "maps/BlmapChill.map" https://github.com/DDNetPP/maps/raw/52774bedf96151518893c7b665bfe6952ec950ed/BlmapChill.map


CMD ["/ddnetpp/DDNetPP"]

