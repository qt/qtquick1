
cmake_minimum_required(VERSION 2.8)

project(test_modules)

find_package(Qt5Script REQUIRED)
find_package(Qt5Widgets REQUIRED)

find_package(Qt5Quick1 REQUIRED)

include_directories(
  ${Qt5Quick1_INCLUDE_DIRS}
)

add_definitions(
  ${Qt5Quick1_DEFINITIONS}
)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${Qt5Core_EXECUTABLE_COMPILE_FLAGS}")

add_executable(mainapp main.cpp)
target_link_libraries(mainapp
  ${Qt5Quick1_LIBRARIES}
)
