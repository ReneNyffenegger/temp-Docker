FROM busybox 

#
#  busybox has a directory /var, but not
#  /var/log
#
#  Create it at run time:
#
RUN        mkdir /var/log

ENTRYPOINT /bin/sh -c 'echo ENTRYPOINT was executed at $(date +%H:%M:%S) >> /var/log/entrypoint.log; cat /var/log/entrypoint.log'
