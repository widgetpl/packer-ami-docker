#!/usr/bin/env bash

sudo cp /etcfstab /tmp/fstab

echo "setting up /var/lib/docker volume..."

sudo mkfs -t xfs /dev/${DOCKER_EBS_NAME}
sudo mkdir /var/lib/docker
sudo mount /dev/${DOCKER_EBS_NAME} /var/lib/docker
sudo echo "/dev/${DOCKER_EBS_NAME}  /var/lib/docker  xfs  defaults,nofail  0  2" >> /tmp/fstab


echo "setting up /var/container_data volume..."

sudo mkfs -t xfs /dev/${CONTAINER_DATA_EBS_NAME}
sudo mkdir /var/container_data
sudo mount /dev/${CONTAINER_DATA_EBS_NAME} /var/container_data
sudo echo "/dev/${CONTAINER_DATA_EBS_NAME}  /var/container_data  xfs  defaults,nofail  0  2" >> /tmp/fstab


echo "setting up /var/log volume..."

sudo mkfs -t xfs /dev/${LOG_EBS_NAME}
sudo mount /dev/${LOG_EBS_NAME} /var/log
sudo echo "/dev/${LOG_EBS_NAME}  /var/log  xfs  defaults,nofail  0  2" >> /tmp/fstab

cat /tmp/fstab
sudo cp /tmp/fstab /etc/fstab