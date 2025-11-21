FROM ubuntu:24.04

ARG DDNETPP_VERSION=v0.1.1

WORKDIR /ddnetpp

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install pkg-config cmake ninja-build libsqlite3-dev build-essential git libssl-dev cargo rustc python3 -y
RUN apt-get install wget unzip libcurl4-openssl-dev libpng-dev -y

RUN wget -O ddnetpp.zip https://github.com/DDNetPP/DDNetPP/archive/refs/tags/$DDNETPP_VERSION.zip

RUN unzip ddnetpp.zip
RUN rm ddnetpp.zip
RUN mv * ddnetpp-src

RUN mkdir ddnetpp-src/build
RUN cd ddnetpp-src/build && cmake .. -DPREFER_BUNDLED_LIBS=ON -DCLIENT=OFF && make -j$(nproc)

FROM ubuntu:24.04

WORKDIR ddnetpp/

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install sqlite3 curl -y

COPY --from=0 /ddnetpp/ddnetpp-src/build/DDNetPP .

RUN echo 'sv_map BlmapChill' > autoexec.cfg

RUN mkdir maps

# BlmapChill v0183
RUN curl -L -o "maps/BlmapChill.map" https://github.com/DDNetPP/maps/raw/52774bedf96151518893c7b665bfe6952ec950ed/BlmapChill.map


CMD ["/ddnetpp/DDNetPP"]

