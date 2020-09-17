#!/bin/bash
docker build -t kdop/default-http-backend:0.0.1 .
docker push kdop/default-http-backend:0.0.1
docker run --rm -p 8080:80 --name=default-http-backend kdop/default-http-backend:0.0.1