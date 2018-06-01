FROM alpine

ENV DEBIAN_FRONTEND noninteractive

RUN apk add octave --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add less

RUN addgroup octave && adduser -D -s /bin/bash octave -G octave
COPY HMM /home/octave/
ADD run.sh /home/octave/
RUN chown -R octave:octave /home/octave/
RUN mkdir -p /root/shared/results/
RUN chown -R octave:octave /root

USER root
WORKDIR /home/octave

ENTRYPOINT ["/home/octave/run.sh"]
