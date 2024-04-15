FROM openjdk:8-alpine

RUN wget https://github.com/dlcbld/deliver-artifact-test/blob/build-deliver-trigger-test/build_spec_ocir.yml

RUN curl -vv -I https://about.gitlab.com/

## Install python3
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 --version

## Run PIP command
RUN python3 -m pip install --user --upgrade pip
RUN python3 -m pip install --user virtualenv

COPY ./src/main/java/org/example/HelloWorld.class /app/org/example/HelloWorld.class
WORKDIR /app
ENTRYPOINT ["java", "org.example.HelloWorld"]
