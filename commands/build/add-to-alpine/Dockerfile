FROM busybox AS base

WORKDIR /workdir

# ENV tq84_var_one=foo
# ENV tq84_var_two="tq84_var_one is $tq84_var_bar"

COPY           tq84-install-script.sh .

CMD  chmod u+x tq84-install-script.sh && \
             ./tq84-install-script.sh && \
     rm        tq84-install-script.sh


ENTRYPOINT
