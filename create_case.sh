#!/bin/bash

# This script sets up a WPS case
# Relies on github repository being present at /home/ubuntu

# User options
# Define Case Name and Create WPS directory under shared 
export CASE_NAME=WPSCONUScase
export SHARED_DIR=home/ubuntu/shared/
export SETUP_DIR=${SHARED_DIR}/${CASE_NAME}
export WPS_DIR=/home/ubuntu/shared/spack/opt/spack/linux-ubuntu22.04-neoverse_v1/gcc-11.4.0/wps-4.5-lob2g75hhds5izxje3msnbj3lp7ui3ff/
# End user options

# link executables and inputs
mkdir -p ${SETUP_DIR}
cd ${SETUP_DIR}
ln -s ${WPS_DIR}/geogrid/geogrid.exe geogrid.exe
ln -s ${WPS_DIR}/geogrid geogrid
ln -s ${WPS_DIR}/ungrib/ungrib.exe ungrib.exe
ln -s ${WPS_DIR}/ungrib ungrib
ln -sf ${WPS_DIR}/ungrib/Variable_Tables/Vtable.GFS Vtable

cp ${WPS_DIR}/link_grib.csh
ln -s ${WPS_DIR}/metgrid/metgrid.exe metgrid.exe
ln -s ${WPS_DIR}/metgrid metgrid

# Create a met_data directory to store GFS downloads
mkdir -p ${SHARED_DIR}/met_data
cd ${SHARED_DIR}/met_data

# Copy GFS download scripts and CONUS namelist from github
cp /home/ubuntu/WPSonC7g/fnl_download_scripts/* . 
cp /home/ubuntu/WPSonC7g/namelists/namelist.wps ${SETUP_DIR}/


# Run geogrid.exe
#./geogrid.exe

# Download and link input GRIB data

# Run ungrib.exe
#
# Run metgrid.exe
#
# Move data to S3 bucket
# aws s3 cp /home/ubuntu/shared/WPSCONUScase/metgrid_out s3://wrfinputs/gfs/metgrid_out/ --recursive

# Shut down the instance
#

