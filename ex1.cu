#include <stdio.h>

__global__ void printf(){
   
   int idx = blockIdx.x * blockDim.x + threadIdx.x;
   int idy = blockIdx.y * blockDim.y + threadIdx.y;
   int global_id = idy * (gridDim.x * blockDim.x) + idx;

    printf("Block(%d,%d), thread(%d,%d) -> Global:%d\n", blockIdx.x , blockIdx.y , threadIdx.x , threadIdx.y , global_id);
   
}

int main(int argc,char* argv[]) {
    
    if (argc != 5) { fprintf(stderr, "%s must have four arguments\n", argv[0]); return 1;}
    
    int gridDimX = atoi(argv[1]);
    int gridDimY = atoi(argv[2]);
    int blockDimX = atoi(argv[3]);
    int blockDimY = atoi(argv[4]);

    dim3 blocks(blockDimX,blockDimY);
    dim3 grid(gridDimX,gridDimY);
    
    printf<<<grid,blocks>>>();
    cudaDeviceSynchronize();

    printf("\n"); return 0;
}