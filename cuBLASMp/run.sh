export OMPI_ALLOW_RUN_AS_ROOT=1
export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1

export NVSHMEM_INFO=true
export NVSHMEM_DEBUG=true

# export HPCXROOT=/workspace/hpcx-v2.23-gcc-doca_ofed-ubuntu22.04-cuda12-x86_64
export HPCXROOT=/workspace/CUDALibrarySamples/cuBLASMp/hpcx-v2.7.0-gcc-MLNX_OFED_LINUX-5.1-0.6.6.0-redhat7.6-x86_64
source ${HPCXROOT}/hpcx-init.sh
export TOPO=nvswitch
# source ${HPCXROOT}/hpcx-mt-init-ompi.sh
hpcx_load

export LD_LIBRARY_PATH=$HPCXROOT/ucx/lib:$HPCXROOT/ucc/lib:$LD_LIBRARY_PATH

cd build
# mpirun -n 2 ./pmatmul -m 1024 -n 1024 -k 1024 


# rm *.log
# for size in 1024 2048 4096 8192 16384
# do 
#     mpirun -n 2 ./pmatmul -m $size -n $size -k $size > matmul_size_${size}.log 
# done

# rm *.log
for size in 256 512 1024 2048 4096 8192 16384
do 
    mpirun -n 4 ./pmatmul -m $size -n $size -k $size > ${TOPO}_matmul_size_m_${size}.log 
done


