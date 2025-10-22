FROM ubuntu:rolling

RUN apt-get update && apt-get install -y bash jq curl
