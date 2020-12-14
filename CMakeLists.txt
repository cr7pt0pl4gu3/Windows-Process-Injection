cmake_minimum_required(VERSION 3.17)
project(Windows_Process_Injection C CXX)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 11)


add_executable(toolhelp process-enumeration/toolhelp.c)
add_executable(wts process-enumeration/wts.c)
add_executable(remote-thread process-injection/remote-thread.c)
add_executable(apc process-injection/apc.cpp)
