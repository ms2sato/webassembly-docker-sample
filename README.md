# webassembly-docker-sample
sample of ms2sato/webassembly-docker

# Usage

```
docker-compose build
docker-compose run --rm app /bin/bash

$ build.sh sample.c # for compiled wasm on ./data/html/sample.wasm
$ exit

docker-compose up
```

and access `localhost:8080`. 
