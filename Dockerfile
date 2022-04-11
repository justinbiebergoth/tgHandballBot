# ================================
# Build image
# ================================
FROM swift:focal as build


RUN mkdir /root/.ssh/

WORKDIR /build
COPY ./Package.* ./
RUN swift package resolve
COPY . .
RUN swift build --enable-test-discovery -c release -Xswiftc -g

# Run image
FROM ubuntu:20.04
RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -qq install \
          binutils \
          git \
          gnupg2 \
          libc6-dev \
          libcurl4 \
          libedit2 \
          libgcc-9-dev \
          libpython2.7 \
          libsqlite3-0 \
          libstdc++-9-dev \
          libxml2 \
          libz3-dev \
          pkg-config \
          tzdata \
          uuid-dev \
          zlib1g-dev
WORKDIR /run
COPY --from=build /build/.build/release /run
COPY --from=build /usr/lib/swift/ /usr/lib/swift/
#COPY --from=build /build/Public /run/Public
COPY --from=build /build/logs /run/logs
ENTRYPOINT [“./Run]
