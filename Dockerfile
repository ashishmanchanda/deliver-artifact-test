FROM openjdk:8-alpine

RUN docker pull iad.ocir.io/id204we8d65n/openjdk8-alpine:1.0

## check wget command
RUN wget https://github.com/dlcbld/deliver-artifact-test/blob/build-deliver-trigger-test/build_spec_ocir.yml

## check curl from docker
RUN apk --no-cache add curl
RUN curl -vv -I https://about.gitlab.com/

COPY ./src/main/java/org/example/HelloWorld.class /app/org/example/HelloWorld.class
WORKDIR /app
ENTRYPOINT ["java", "org.example.HelloWorld"]
