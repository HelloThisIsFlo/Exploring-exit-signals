# From a regular Ubuntu image
FROM ubuntu

# Copy the 2 scripts
COPY ./trap.sh /trap.sh
COPY ./sleep.sh /sleep.sh

