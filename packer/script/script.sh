#!/usr/bin/env bash
set -x
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
sudo apt-get update -y
# https://docs.frrouting.org/en/latest/bgp.html#clicmd-rpki
sudo apt-get -y install strongswan net-tools libunwind-dev python3-dev install-info protobuf-c-compiler libzmq5 libzmq3-dev frr charon-systemd strongswan-pki frr-rpki-rtrlib plocate
sudo apt-get upgrade -y