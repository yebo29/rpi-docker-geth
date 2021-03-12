FROM arm64v8/golang:latest

# Since we build on ARM, we need atleast v1.6 because we need this fix:
# https://github.com/ethereum/go-ethereum/pull/3715
ARG ETHVERSION=1.10

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get install -y apt-utils
RUN apt-get install -y build-essential git net-tools wget make libglib2.0-dev
RUN git clone https://github.com/ethereum/go-ethereum.git --single-branch -b release/$ETHVERSION --depth 1
RUN cd go-ethereum ; make geth
RUN mv /go/go-ethereum/build/bin /usr/local/sbin/

CMD []
ENTRYPOINT ["/usr/local/sbin/bin/geth"]
