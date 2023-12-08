#!/bin/bash

# This script sets up C7g instances to run WPS - all items that need to be installed once
# Takes more than an hour and needs tmux or other terminal multiplexer to keep connection alive

# Define the large shared volume path
export SHARED_DIR=home/ubuntu/shared/

# Prepare the large gp3 volume (assumes it is on nvme1n1)
lsblk
sudo mkfs -t xfs /dev/nvme1n1
sudo mkdir -p ${SHARED_DIR}
sudo chown ubuntu ${SHARED_DIR}
sudo chgrp ubuntu ${SHARED_DIR}
sudo mount /dev/nvme1n1 ${SHARED_DIR}

# Make the mount permanent
sudo echo "$(blkid -o export /dev/nvme1n1 | grep ^UUID=) /home/ubuntu/shared xfs defaults,noatime" | sudo tee -a /etc/fstab
sudo mount -a

# Update OS and Install prerequisites
sudo apt update
sudo apt install build-essential ca-certificates coreutils curl environment-modules gfortran git gpg lsb-release python3 python3-distutils python3-venv unzip zip

# Install spack at home so it can be saved along with snapshots
cd ~
git clone -c feature.manyFiles=true https://github.com/spack/spack.git
. spack/share/spack/setup-env.sh

# Install WPS and prerequisites using spack
spack install wps

<<<<<<< HEAD
# Download GEOGRID inputs into the large shared volume
cd ${SHARED_DIR}
wget -c https://www2.mmm.ucar.edu/wrf/src/wps_files/geog_high_res_mandatory.tar.gz
tar -xvzf geog_high_res_mandatory.tar.gz -C ${SHARED_DIR}
rm geog_high_res_mandatory.tar.gz

=======
# Download GEOGRID inputs and put them in the large volume
cd ${SHARED_DIR}
wget -c https://www2.mmm.ucar.edu/wrf/src/wps_files/geog_high_res_mandatory.tar.gz
tar -xvzf geog_high_res_mandatory.tar.gz -C ${SHARED_DIR}
>>>>>>> 327286cda19a9b0c35257c087df96ebf58e1014b
