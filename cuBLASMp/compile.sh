cd build
export HPCXROOT=/workspace/hpcx-v2.23-gcc-doca_ofed-ubuntu22.04-cuda12-x86_64
# export HPCXROOT=/workspace/CUDALibrarySamples/cuBLASMp/hpcx-v2.7.0-gcc-MLNX_OFED_LINUX-5.1-0.6.6.0-redhat7.6-x86_64
export NCCL_HOME=/usr/local/lib/python3.11/dist-packages/nvidia/nccl/lib
source ${HPCXROOT}/hpcx-mt-init-ompi.sh
hpcx_load

cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CUDA_ARCHITECTURES="80;" \
    -DCUBLASMP_INCLUDE_DIRECTORIES=/usr/include/libcublasmp \
    -DCUBLASMP_LIBRARIES=/usr/lib/x86_64-linux-gnu/libcublasmp/12/libcublasmp.so \
    -DCAL_INCLUDE_DIRECTORIES=/usr/include/libcal \
    -DCAL_LIBRARIES=/usr/lib/x86_64-linux-gnu/libcal/12/libcal.so \
    -DNVSHMEM_INCLUDE_DIRECTORIES=/usr/include/nvshmem_12 \
    -DNVSHMEM_HOST_LIBRARIES=/usr/lib/x86_64-linux-gnu/nvshmem/12/libnvshmem_host.so \
    -DNVSHMEM_DEVICE_LIBRARIES=/usr/lib/x86_64-linux-gnu/nvshmem/12/libnvshmem_device.a \
    -DCMAKE_EXE_LINKER_FLAGS="-Wl,--no-as-needed -lnvshmem_host -lnccl" \
    -DNCCL_ROOT=$NCCL_HOME
    
make -j10
    
