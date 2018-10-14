#!/bin/bash


sudo apt-get -yy update
sudo apt-get -yy install git puppet

git clone https://github.com/devops-studentXX/puppet.git

cd puppet
sudo puppet apply init.pp --modulepath modules
