# Download base image Ubuntu 16.04
FROM ubuntu:16.04

# Update Ubuntu software repository
RUN apt-get update && apt-get install -y --no-install-recommends \
  && apt-get install -y python3 \
  python-pip software-properties-common  

# Install PCL and Eigen
RUN apt-get install -y libpcl-dev>=1.9 libeigen3-dev

# Install OpenCV 3.4
RUN pip3 install opencv-python==3.4

RUN mkdir build
WORKDIR build

RUN cmake .. && make -j && make install
