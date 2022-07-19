clear
rm -r build
mkdir -p build
cd build
# as of 2021-01-13 we're using gcc 9.3 as there's a bug with clang 13 and couldn't find
# a way how to downgrade to clang 12 (gcc 9.3 was last known working version)
# With clang 13 mbedTls would compile but samarai wouldn't connect to Alotau as TLS connection fails
cmake -G Ninja -D APPLE_TARGET_ARCHITECTURE=x86_64 -D CMAKE_BUILD_TYPE=Release -D CMAKE_C_COMPILER=/usr/local/bin/gcc-9 -D CMAKE_CXX_COMPILER=/usr/local/bin/g++-9 .. 
cmake --build ./
cd .. 