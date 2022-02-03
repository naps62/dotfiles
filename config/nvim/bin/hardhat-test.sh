#!/bin/bash -ue

hardhat compile
./node_modules/.bin/mocha --require ts-node/register --require hardhat/register $@
