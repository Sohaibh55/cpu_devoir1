#include <stdio.h>

__global__ void printf(){
    int local_id = threadIdx.y * blockDim.x + threadIdx.x;
    
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

    printf("\n"); return 0;
}