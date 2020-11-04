# This image is meant to be run in a graphical environment, so it does not
# work on Windows. Example usage:
# docker run -it --rm -e DISPLAY=$DISPLAY \
# -v $HOME/.Xauthority:/root/.Xauthority lcrergo/ghidra-otr
FROM debian
# Metadata
LABEL version="1.0"
LABEL author="Lucas Cruz dos Reis"
LABEL description="A docker image to deploy ghidra on the run"

RUN apt-get update && apt-get install -y unzip default-jdk
ADD https://ghidra-sre.org/ghidra_9.1.2_PUBLIC_20200212.zip \
    /opt/
RUN cd /opt/ && unzip ghidra_9.1.2_PUBLIC_20200212.zip -d /usr/local/share && \
    ln -s /usr/local/share/ghidra_9.1.2_PUBLIC/ghidraRun /usr/local/bin/ghidra
