FROM gliderlabs/alpine:3.1
RUN apk-install ca-certificates polarssl
ADD https://github.com/coreos/etcd/archive/v2.0.11.tar.gz v2.0.11.tar.gz
RUN tar xzvf v2.0.11.tar.gz
RUN mv v2.0.11/etcd /bin && mv v2.0.11/etcdctl /bin && rm -Rf v2.0.11*
VOLUME /data
ADD run.sh /bin/
EXPOSE 2379 2380 4001 7001
ENTRYPOINT ["/bin/run.sh"]

