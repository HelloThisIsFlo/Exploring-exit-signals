# From a regular Ubuntu image
FROM ubuntu

# Copy the 2 scripts
COPY ./trap.sh /trap.sh
COPY ./trap_exec.sh /trap_exec.sh
COPY ./sleep.sh /sleep.sh
COPY ./thirdlayer.sh /thirdlayer.sh
COPY ./exec_sleep.sh /exec_sleep.sh
COPY ./exec_trap.sh /exec_trap.sh


COPY ./trapdaemon.sh /trapdaemon.sh

#CMD ./sleep.sh
CMD ["./sleep.sh"]
