FROM debian:trixie

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		build-essential \
		libboost-program-options-dev \ 
		cmake \
		git \

WORKDIR /app

RUN git clone https://github.com/Bgari133/simple_port_scanner.git

WORKDIR /app/simple_port_scanner

RUN cmake -S . -B build
RUN cmake --build build

ENTRYPOINT ["./build/simplePortScanner"]
CMD ["--help"]
