FROM debian:trixie

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        libboost-program-options-dev \
        cmake \
        git \
        ca-certificates \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/Bgari133/simple_port_scanner.git .

RUN cmake -S . -B build -DCMAKE_BUILD_TYPE=Release \
    && cmake --build build --parallel 2

ENTRYPOINT ["./build/simplePortScanner"]
CMD ["--help"]