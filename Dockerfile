FROM gliderlabs/alpine:3.1
RUN apk-install ca-certificates polarssl
ADD https://github.com/coreos/etcd/releases/download/v2.0.11/etcd-v2.0.11-linux-amd64.tar.gz etcd-v2.0.11-linux-amd64.tar.gz
RUN tar xzvf etcd-v2.0.11-linux-amd64.tar.gz
RUN mv etcd-v2.0.11-linux-amd64/etcd /bin && mv etcd-v2.0.11-linux-amd64/etcdctl /bin && rm -Rf etcd-v2.0.11-linux-amd64*
VOLUME /data
ADD run.sh /bin/
EXPOSE 2379 2380 4001 7001
ENTRYPOINT ["/bin/run.sh"]

