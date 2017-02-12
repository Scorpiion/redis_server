#!/bin/bash

# Start redis function
function startRedis {
  $HOME/redis-stable/src/redis-server --protected-mode no & 
}

# Shutdown redis function
function shutdownRedis {
  kill -SIGTERM $(jobs -p)
}

# Print connection info 
function redisAddress {
  sleep 1
  echo ""
  echo "Redis is running on: $(ip a s dev eth0 | grep "global eth0" | awk '{ print $2 }' | sed -e 's|/22||'):6379"
  
  # Fix for temporary caching delay at Sourcevoid
  sleep 0.1
  echo ""
}

# When we get signal "SIGTERM", shutdown redis
trap shutdownRedis SIGTERM

# Start redis 
startRedis

# Print info
redisAddress

# Wait for redis to shutdown
wait 

