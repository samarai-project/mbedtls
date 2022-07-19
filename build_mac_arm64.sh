clear
rm -r build
mkdir -p build
cd build
# as of 2021-01-13 we're using gcc as there's a bug with clang 13 and couldn't find
# a way how to downgrade to clang 12, see
# https://github.com/Mbed-TLS/mbedtls/issues/5052
# With clang 13 mbedTls would compile but samarai wouldn't connect to Alotau as TLS connection fails
cmake -G Ninja -D APPLE_TARGET_ARCHITECTURE=arm64 -D CMAKE_BUILD_TYPE=Release -D CMAKE_C_COMPILER=/opt/homebrew/bin/gcc-11 -D CMAKE_CXX_COMPILER=/opt/homebrew/bin/g++-11 .. 
cmake --build ./
cd ..