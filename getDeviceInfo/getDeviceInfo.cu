#include <stdio.h>
#include <iostream>

int main() {
  int nDevices;

  cudaError_t err = cudaGetDeviceCount(&nDevices);
  if (err != cudaSuccess) {
      std::cerr << "Error: " << cudaGetErrorString(err) << std::endl;
      return 1;
  }

  std::cout << "Number of devices: " << nDevices << std::endl;
  for (int i = 0; i < nDevices; i++) {
    cudaDeviceProp prop;
    cudaError_t err = cudaGetDeviceProperties(&prop, i);
    if (err != cudaSuccess) {
        std::cerr << "Error: " << cudaGetErrorString(err) << std::endl;
        return 1;
    }
    std::cout << "Device Number: " << i
        << "\n  Device name: " << prop.name
        << "\n  Memory Clock Rate (KHz): " << prop.memoryClockRate
        << "\n  Memory Bus Width (bits): " << prop.memoryBusWidth
        << "\n  Peak Memory Bandwidth (GB/s): " << 2.0*prop.memoryClockRate*(prop.memoryBusWidth/8)/1.0e6 
        << std::endl;
  }

  return 0;
}
