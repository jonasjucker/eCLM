#!/bin/bash

. build-env
# User-specific variables
BUILD_DIR="bld"
INSTALL_DIR="eclm"
echo -DNetCDF_F90_LIBRARIES=$NETCDF_DIR/lib

# Run cmake
cmake -S src -B "$BUILD_DIR" \
      -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR" \
      -DCMAKE_C_COMPILER=cc \
      -DCMAKE_Fortran_COMPILER=ftn \
      -DNetCDF_C_INCLUDEDIR=$NETCDF_DIR/include \
      -DNetCDF_F90_INCLUDEDIR=$NETCDF_DIR/include \
      -DNetCDF_F90_LIBRARIES=$NETCDF_DIR/lib \
      -DPnetCDF_INCLUDEDIR=$PNETCDF_DIR/include \
      -DPnetCDF_LIBRARIES=$PNETCDF_DIR/lib

cmake --build "$BUILD_DIR"
cmake --install "$BUILD_DIR"
