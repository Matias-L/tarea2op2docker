#-------------------------------------------------
# Stage 1 - Construyo el binario
#-------------------------------------------------
FROM ubuntu:16.04 as builder
LABEL maintainer="Matias Lionel Ceballos" \
      version="0.1" \
      lenguaje="java" \
      stage="build" \
      description="Tarea dada la segunda clase del workshop docker, opcion 2."

RUN apt-get update && \
    apt-get install -y default-jdk && \
    mkdir /appjava

WORKDIR /appjava
COPY main.java /appjava
RUN javac main.java

#-------------------------------------------------
# Stage 2 - Ejecuto el binario
#-------------------------------------------------
FROM alpine:3.7
LABEL maintainer="Matias Lionel Ceballos" \
      version="0.1" \
      stage="execute" \
      description="Tarea dada la segunda clase del workshop docker, opcion 2, entorno ejecucion"

RUN apk update && \
    apk add openjdk8-jre

COPY --from=builder /appjava/main /bin/main
WORKDIR /bin/main
