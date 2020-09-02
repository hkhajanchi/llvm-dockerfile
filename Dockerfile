FROM hkhajanchi/hacking-dockerfile:latest 

# Install some necessary build packages 
RUN apt-get update && \ 
    apt-get install -y \
    ninja  
    
# Build LLVM 10.0 using Simone's LLVM installer repo 
RUN git clone https://github.com/scampanoni/LLVM_Installer &&\
    mkdir 10.0.0 &&\
    cd LLVM_Installer &&\
    mv * ../10.0.0 &&\
    cd 10.0.0 &&\
    make -j64 debug 

# Generate Ninja build files for recompiling backend 
RUN cmake . -G ninja 