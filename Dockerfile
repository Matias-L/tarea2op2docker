#-------------------------------------------------
# Stage 1 - Construyo el binario
#-------------------------------------------------
FROM openjdk:7 as builder
LABEL maintainer="Matias Lionel Ceballos" \
      version="0.1" \
      lenguaje="java" \
      stage="build" \
      description="Tarea dada la segunda clase del workshop docker, opcion 2."

COPY /java /usr/src/appjava
WORKDIR /usr/src/appjava
RUN javac Tarea.java && \
    jar ccmf Tarea.mf tarea.jar Tarea.class Tarea.java


#-------------------------------------------------
# Stage 2 - Ejecuto el binario
#-------------------------------------------------
FROM openjdk:7-alpine as runtime
LABEL maintainer="Matias Lionel Ceballos" \
      version="0.1" \
      stage="execute" \
      description="Tarea dada la segunda clase del workshop docker, opcion 2, entorno ejecucion"

COPY --from=builder /usr/src/appjava /bin/main/javaapp
WORKDIR /bin/main/javaapp
CMD ["java -jar tarea.jar"]