cmake_minimum_required(VERSION 3.10)

# Project name
project(MyProject VERSION 1.0 LANGUAGES C)

# Set C standard
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Define directory structure
set(SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)
set(BINARY_DIR ${CMAKE_CURRENT_SOURCE_DIR}/bin)
set(LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/lib)

# Create directories if they don't exist
file(MAKE_DIRECTORY ${SOURCE_DIR})
file(MAKE_DIRECTORY ${INCLUDE_DIR})
file(MAKE_DIRECTORY ${BINARY_DIR})
file(MAKE_DIRECTORY ${LIB_DIR})

# Find all C source files in the source directory
file(GLOB_RECURSE SOURCES "${SOURCE_DIR}/*.c")

# Add include directory to include path
include_directories(${INCLUDE_DIR})

# Output executable to bin directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${BINARY_DIR})

# Define executable target
add_executable(${PROJECT_NAME} ${SOURCES})

# Example of how to add a library
# add_library(mylib STATIC ${LIB_SOURCES})
# target_include_directories(mylib PUBLIC ${INCLUDE_DIR})
# target_link_libraries(${PROJECT_NAME} mylib)

# Install targets (uncomment and modify as needed)
# install(TARGETS ${PROJECT_NAME} DESTINATION bin)
# install(DIRECTORY ${INCLUDE_DIR}/ DESTINATION include FILES_MATCHING PATTERN "*.h")

# Add custom commands to create basic files if needed
# if(NOT EXISTS "${SOURCE_DIR}/main.c")
#     file(WRITE "${SOURCE_DIR}/main.c" 
# "#include <stdio.h>
#
# int main() {
#     printf(\"Hello from %s!\\n\", \"${PROJECT_NAME}\");
#     return 0;
# }
# ")
# endif()


message(STATUS "Project setup complete. Directory structure created:")
message(STATUS "  - Source files: ${SOURCE_DIR}")
message(STATUS "  - Headers: ${INCLUDE_DIR}")
message(STATUS "  - Binaries: ${BINARY_DIR}")
message(STATUS "  - Libraries: ${LIB_DIR}")

