# docker-tick-stack-armhf


# Useful Stuff

## Backup named volume (e.g. grafana-data) [http://loomchild.net/2017/03/26/backup-restore-docker-named-volumes/]

docker run --rm -v grafana-data-volume:/volume -v $(pwd):/backup hypriot/armhf-busybox tar -cjf /backup/backup_archive.tar.bz2 -C /volume ./

## Restore named volume

docker run -it -v grafana-data-volume:/volume -v $(pwd):/backup hypriot/armhf-busybox sh -c "rm -rf /volume/*; tar -C /volume/ -xjf /backup/backup_archive.tar.bz2"
