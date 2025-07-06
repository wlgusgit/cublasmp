cublasmp
wget https://developer.download.nvidia.com/compute/cublasmp/0.4.0/local_installers/cublasmp-local-repo-ubuntu2204-0.4.0_0.4.0-1_amd64.deb
dpkg -i cublasmp-local-repo-ubuntu2204-0.4.0_0.4.0-1_amd64.deb
cp /var/cublasmp-local-repo-ubuntu2204-0.4.0/cublasmp-*-keyring.gpg /usr/share/keyrings/
apt-get update
apt-get -y install cublasmp

# nvshmem
wget https://developer.download.nvidia.com/compute/nvshmem/3.2.5/local_installers/nvshmem-local-repo-ubuntu2204-3.2.5_3.2.5-1_amd64.deb
dpkg -i nvshmem-local-repo-ubuntu2204-3.2.5_3.2.5-1_amd64.deb
cp /var/nvshmem-local-repo-ubuntu2204-3.2.5/nvshmem-*-keyring.gpg /usr/share/keyrings/
apt-get -y install nvshmem

sed -i '/developer.download.nvidia.com/d' /etc/apt/sources.list.d/*.list
apt-get update

apt-get clean
apt-get autoremove --purge -y
dpkg --configure -a
apt --fix-broken install

apt-get -y install cmake libopenmpi-dev openmpi-bin 

wget https://www.mellanox.com/downloads/hpc/hpc-x/v2.7/hpcx-v2.7.0-gcc-MLNX_OFED_LINUX-5.1-0.6.6.0-redhat7.6-x86_64.tbz
tar -xvf hpcx-*.tbz
cd hpcx-*
export HPCX_HOME=$PWD

source $HPCX_HOME/hpcx-init.sh

