# Run Geth on a Raspberry Pi or compatible ARM board using docker

This is a clone of [asmike/golang/raspbian-docker](https://github.com/askmike/golang-raspbian-docker).

Run the Geth client on a Raspberry Pi or compatible ARM board using docker. This has only been tested on an RPi4.
This uses the ARM64v8 build of the official golang docker image and builds on top of that.

* *NOTE:* Requires a 64 bit OS
* For best results, use an Rpi4/board with 8GB RAM or more as you may experience OOM errors if there is not enough RAM
* It is not recommended to use the SDCARD to store the blockchain as it will shorten its lifespan. Use external storage instead, SSD preferred.
* If you have less memory, consider setting `syncmode` to light, or keeping and properly setting the `--cache` option

## Usage

Build:
* Make sure to change the Dockerfile to include the correct version you require of Geth. See -> https://github.com/ethereum/go-ethereum/branches
* Change "[NAME]" to whatever suits you
```
docker build -t "[NAME]" .
```
* You can also build using the docker-compose file:
```
docker-compose build
```
* I'm following the official docs -> https://docs.chain.link/docs/running-a-chainlink-node
  * Specifically -> https://docs.chain.link/docs/run-an-ethereum-client#geth

## Docker-compose
* I've also included the docker-compose file I'm using.
* Make sure to create any required directories and/or modify settings and then run:
```
docker-compose build # only if you haven't yet built the image
docker-compose up -d && docker-compose logs -f [service-name] #up will recreate if already existing
```
* Base taken from https://github.com/pokt-network/docker-geth/blob/master/docker-compose.yml
* Remove the `--cache` option if you have plenty of memory
* You can use the testnet via:
```
version: '3.3'

volumes:
  geth-rinkeby: {}

services:
  geth-rinkeby:
    image: golang-geth-arm
    build:
      context: .
      dockerfile: Dockerfile
    restart: unless-stopped
    expose:
      - "8545-8546"
      - "30303"
    volumes:
      - /home/pi/.geth_rinkeby:/geth_rinkeby
    command: '[OPTIONS'
```
* Make sure to edit the Dockerfile to suit and rebuild

## Extras
The `utils` directory contains scripts useful for working with the geth console
* You can connect to the geth console via
```
geth attach ws://[ip-address]:8546
```
* See https://geth.ethereum.org/docs/interface/javascript-console for more information
