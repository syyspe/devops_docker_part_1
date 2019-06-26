FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl
RUN mkdir /code
WORKDIR /code
COPY start.sh /code/
ENTRYPOINT [ "/code/start.sh" ]