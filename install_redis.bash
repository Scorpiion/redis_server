#!/bin/bash

# Install Redis if not already installed
if [ ! -f "${HOME}/redis-stable/src/redis-server" ] ; then
  # Go to env cache (/home/cuser/cache/)
  cd $HOME
  
  # Download Redis
  curl -O http://download.redis.io/redis-stable.tar.gz

  # Unpack
  tar -zxvf redis-stable.tar.gz

  # Remove tar.gz
  rm redis-stable.tar.gz

  # Build Redis
  cd redis-stable
  make
  
  # Add to path 
  echo "export PATH=\$PATH:/home/cuser/cache/redis-stable/src" >> ${HOME}/.bashrc
fi

