# Run Geth on a Raspberry Pi using docker

This is a clone of [asmike/golang/raspbian-docker](https://github.com/askmike/golang-raspbian-docker)
Run the Geth client on a Raspberry Pi using docker. This has only been tested on an RPi4.
This uses the ARM32v7 build of the official golang docker image and builds on top of that.

## Usage

Build:
* Make sure to change the Dockerfile to include the correct version you require of Geth. See -> https://github.com/ethereum/go-ethereum/branches
* Currently set to the most current stable `1.9`
* Change "[NAME]" to whatever suits you

    docker build -t "[NAME]" .

Run:
* I'm following the official docs -> https://docs.chain.link/docs/running-a-chainlink-node
** Specifically -> https://docs.chain.link/docs/run-an-ethereum-client#geth
* I've also included the docker-compose file I'm using.
* Make sure to create any required directories and then run:

   docker-compose up -d && docker-compose logs -f [service-name]
