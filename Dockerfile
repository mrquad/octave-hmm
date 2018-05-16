FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y octave less
RUN apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -ms /bin/bash octave
COPY HMM /home/octave/
ADD run.sh /home/octave/
RUN chown -R octave:octave /home/octave/
RUN mkdir -p /root/shared/results/
RUN chown -R octave:octave /root/

USER octave
WORKDIR /home/octave

#ENTRYPOINT ["/home/octave/run.sh"]
