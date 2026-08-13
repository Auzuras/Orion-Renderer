cmake_minimum_required(VERSION 3.20)

project(ORION_RENDERER LANGUAGES CXX)

option(ORION_RENDERER_TEST_OPT "Build Orion Renderer tests" ON)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

file(GLOB_RECURSE ORION_RENDERER_SOURCES "Source/*.cpp")

add_library(OrionRenderer STATIC ${ORION_RENDERER_SOURCES})

target_include_directories(OrionRenderer PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Include)

if(ORION_RENDERER_TEST_OPT)
    enable_testing()

    add_subdirectory(Tests)
endif()