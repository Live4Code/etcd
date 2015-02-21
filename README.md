# etcd
etcd dokerfile, version 2.0.3
usage

docker run \
  -d \
  -p 2379:2379 \
  -p 2380:2380 \
  -p 4001:4001 \
  -p 7001:7001 \
  -v /data/backup/dir:/data \
  --name some-etcd \
  elcolio/etcd:latest \
  -name some-etcd \
  -discovery=https://discovery.etcd.io/blahblahblahblah
