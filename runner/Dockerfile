FROM docker.io/library/python:3.11
 
RUN apt update && apt install git imagemagick vim libgl1 build-essential -y --no-install-recommends --no-install-suggests
RUN useradd -ms /bin/bash robot
 
USER robot
ENV PATH=${PATH}:/home/robot/.local/bin
ENV EDITOR=/usr/bin/vim
WORKDIR /build
COPY --chown=robot:robot requirements.txt requirements.txt
RUN pip install --user -r requirements.txt