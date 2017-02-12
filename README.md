# Redis server inside a Sourcevoid app environment

## Create archive (or your own Github repo)

    git clone git@github.com:Scorpiion/redis_server.git
    cd redis_server
    ./zip.bash
    
## Create env 

Follow normal procedure @ https://cloud.sourcevoid.com. 

## How does it work? 

This repo includes an install script that downloads, compiles and install redis into the env cache. Then it uses a startup script to start redis and forward the SIGTERM signal correctly. It only downloads and compiles redis on the first deploy, the build pipeline stage can be outcommented after a first deployment. 

# Security Notice!

This is an early prof of concept, do not host critical data using this implementation today. I have not fully tested how persistence works, but it might work out okay using default settings. We do by default route traffic to port 8080 on each app env container, however as redis don't use that port it doesn't matter from a security standpoint (although not optimal).

