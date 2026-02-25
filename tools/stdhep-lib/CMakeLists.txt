cmake_minimum_required(VERSION 3.0)

project(stdhep-lib VERSION 5.6.1)

message(STATUS "StdHep library version: ${stdhep-lib_VERSION}")

find_path(TIRPC_INCLUDE_DIR NAMES rpc/types.h PATHS /usr/include /usr/include/tirpc)
find_library(TIRPC_LIBRARY NAMES tirpc rpc PATHS /usr/lib /usr/lib/x86_64-linux-gnu)

if(TIRPC_INCLUDE_DIR AND TIRPC_LIBRARY)
#    target_include_directories(your_target_name PRIVATE ${TIRPC_INCLUDE_DIR})
#    target_link_libraries(your_target_name PRIVATE ${TIRPC_LIBRARY})
    include_directories(${TIRPC_INCLUDE_DIR})    
else()
    message(FATAL_ERROR "libtirpc not found. Please install the development package.")
endif()

set(RPC_INCLUDE_DIR ${TIRPC_INCLUDE_DIR})
set(RPC_LIBRARY ${TIRPC_LIBRARY})

file(COPY ${PROJECT_SOURCE_DIR}/src/ DESTINATION ${CMAKE_BINARY_DIR}/stdhep-src/)

set(STDHEP_DIR ${CMAKE_BINARY_DIR}/stdhep-src)
set(STDHEP_LIBRARY_DIR ${STDHEP_DIR}/lib)
set(STDHEP_LIBRARIES ${STDHEP_LIBRARY_DIR}/libstdhep.a ${STDHEP_LIBRARY_DIR}/libstdhepC.a ${STDHEP_LIBRARY_DIR}/libFmcfio.a)

set(STDHEP_DIR ${STDHEP_DIR} PARENT_SCOPE)
set(STDHEP_LIBRARY_DIR ${STDHEP_LIBRARY_DIR} PARENT_SCOPE)
set(STDHEP_LIBRARIES ${STDHEP_LIBRARIES} PARENT_SCOPE)

add_custom_command(OUTPUT ${STDHEP_LIBRARIES} 
    COMMAND make RPC_INCLUDE_DIR=${TIRPC_INCLUDE_DIR} RPC_LIBRARY=${TIRPC_LIBRARY}
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/stdhep-src"
    DEPENDS "${CMAKE_BINARY_DIR}/stdhep-src")

add_custom_target(stdhep_lib_build ALL DEPENDS ${STDHEP_LIBRARIES})
