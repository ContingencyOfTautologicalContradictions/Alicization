function(Alicization ALICE_PROJECT ALICE_DEBUG ALICE_OS)
    cmake_minimum_required(VERSION 3.28.1)
    if(ALICE_DEBUG)
        target_compile_definitions(${ALICE_PROJECT} PRIVATE alice_debug=)
    endif()
    if(ALICE_OS STREQUAL "ios")
        target_compile_definitions(${ALICE_PROJECT} PRIVATE alice_ios=)
        file(GLOB_RECURSE ALICE_OBJC_SOURCES ${CMAKE_SOURCE_DIR}/Source/*.mm)
        target_sources(${ALICE_PROJECT} PRIVATE ${ALICE_OBJC_SOURCES})
    elseif(ALICE_OS STREQUAL "mac")
        target_compile_definitions(${ALICE_PROJECT} PRIVATE alice_mac=)
        file(GLOB_RECURSE ALICE_OBJC_SOURCES ${CMAKE_SOURCE_DIR}/Source/*.mm)
        target_sources(${ALICE_PROJECT} PRIVATE ${ALICE_OBJC_SOURCES})
    elseif(ALICE_OS STREQUAL "android")
        target_compile_definitions(${ALICE_PROJECT} PRIVATE alice_android=)
    elseif(ALICE_OS STREQUAL "linux")
        target_compile_definitions(${ALICE_PROJECT} PRIVATE alice_linux=)
    elseif(ALICE_OS STREQUAL "windows")
        target_compile_definitions(${ALICE_PROJECT} PRIVATE alice_windows=)
    else()
        message(FATAL_ERROR "The value given to ALICE_OS is ${ALICE_OS}, must be one of the following:\n\nios\nmac\nandroid\nlinux\nwindows")
    endif()
    target_compile_definitions(${ALICE_PROJECT} PRIVATE alice_major=0 alice_middle=0 alice_minor=1)
    target_compile_features(${ALICE_PROJECT} PRIVATE cxx_std_23)
    file(GLOB_RECURSE ALICE_SOURCES ${CMAKE_SOURCE_DIR}/Source/*.cpp)
    target_sources(${ALICE_PROJECT} PRIVATE ${ALICE_SOURCES})
endfunction()