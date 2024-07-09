#!/usr/bin/env -S cmake -P
cmake_minimum_required(VERSION 3.25)
if(CMAKE_ARGV3 STREQUAL "build")
    set(CMAKE_EXECUTE_PROCESS_COMMAND_ECHO "STDERR")

    if(CMAKE_ARGV4 MATCHES "windows")
        if(NOT WIN32)
            message(FATAL_ERROR "Can only build for Windows on Windows :(")
        endif()
        execute_process(COMMAND ${CMAKE_COMMAND} -B build WORKING_DIRECTORY quickjs)
    else()
        execute_process(
            COMMAND ${CMAKE_COMMAND} -DCMAKE_TOOLCHAIN_FILE=${CMAKE_CURRENT_LIST_DIR}/cmake/zig-toolchain.cmake -DTARGET_SYS=${CMAKE_ARGV4} --fresh -B build
            WORKING_DIRECTORY quickjs
        )
    endif()

    execute_process(
        COMMAND ${CMAKE_COMMAND} --build build
        WORKING_DIRECTORY quickjs
    )

    file(REMOVE_RECURSE dist)
    file(MAKE_DIRECTORY dist)
    file(COPY quickjs/quickjs.h DESTINATION dist)

    if(CMAKE_ARGV4 MATCHES "windows")
        file(GLOB LIB_FILES quickjs/build/**/qjs.lib quickjs/build/qjs.lib)
    else()
        file(GLOB LIB_FILES quickjs/build/**/libqjs.a quickjs/build/libqjs.a)
    endif()

    file(COPY ${LIB_FILES} DESTINATION dist)
elseif(CMAKE_ARGV3 STREQUAL "clean")
    file(REMOVE_RECURSE quickjs/build)
    file(REMOVE_RECURSE dist)
else()
    message(FATAL_ERROR "Unknown task: ${CMAKE_ARGV3}")
endif()