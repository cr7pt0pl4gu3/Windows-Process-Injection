cmake_minimum_required(VERSION 3.17)
project(Windows_Process_Injection C)

set(CMAKE_C_STANDARD 11)

#add_executable(Windows_Process_Injection main.c)
add_executable(toolhelp process-enumeration/toolhelp.c)
add_executable(wts process-enumeration/wts.c)