FROM debian:11.6-slim AS get
WORKDIR /get
RUN apt update && apt install -y wget tar && wget http://www.PtokaX.org/files/0.5.3.0-nix-src.tgz && tar -xf 0.5.3.0-nix-src.tgz

FROM debian:11.6 AS build
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /src
COPY --from=get /get/PtokaX/ .
RUN apt update && apt install -y make g++ zlib1g-dev libtinyxml-dev liblua5.4-dev 
RUN make

EXPOSE 411
ENTRYPOINT ["./PtokaX"]