FROM debian
# Metadata
LABEL version="2.0.0"
LABEL author="Lucas Cruz dos Reis"
LABEL description="A docker image to deploy ghidra on the run"

RUN apt-get update && apt-get install -y unzip
ADD https://ghidra-sre.org/ghidra_9.1.2_PUBLIC_20200212.zip \
    /opt
RUN cd /opt && unzip ghidra_9.1.2_PUBLIC_20200212.zip -d /opt && \
    rm ghidra_9.1.2_PUBLIC_20200212.zip && \
    mv ghidra_9.1.2_PUBLIC ghidra-9.1.2

FROM alpine
COPY --from=0 /opt/ghidra-9.1.2 /opt/ghidra-9.1.2
RUN ln -s /opt/ghidra-9.1.2/ghidraRun /usr/local/bin/ghidra
RUN apk add bash openjdk11-jdk libxext

CMD ["ghidra"]
