include(FetchContent)

set(BUILD_GMOCK OFF)
set(INSTALL_GTEST OFF)
set(gtest_disable_pthreads ON)

FetchContent_Declare(
        googletest
        GIT_REPOSITORY https://github.com/google/googletest.git
        GIT_TAG v1.17.0
        SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/googletest
)

FetchContent_MakeAvailable(googletest)

set(ORION_RENDERER_UT_BIN_OUTPUT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Build/${CMAKE_CXX_COMPILER_ID}_$<CONFIG>")

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${ORION_RENDERER_UT_BIN_OUTPUT_DIR}/Libs")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${ORION_RENDERER_UT_BIN_OUTPUT_DIR}/Libs")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${ORION_RENDERER_UT_BIN_OUTPUT_DIR}")

file(GLOB_RECURSE ORION_RENDERER_UT_SOURCES "Code/Source/*.cpp")

add_executable(OrionRendererTests ${ORION_RENDERER_UT_SOURCES})

target_link_libraries(OrionRendererTests PRIVATE OrionRenderer)

target_link_libraries(OrionRendererTests PRIVATE gtest)

if (MSVC)
    target_compile_options(OrionRendererTests PRIVATE /W4 /WX)
else ()
    target_compile_options(OrionRendererTests PRIVATE -Wall -Wextra -Wpedantic -Werror)
endif ()
