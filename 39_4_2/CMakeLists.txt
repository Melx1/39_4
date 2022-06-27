cmake_minimum_required(VERSION 3.21)
project(39_4_2)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt5 COMPONENTS
        Core
        Gui
        Widgets
        REQUIRED
        )


add_executable(39_4_2 main.cpp)
target_link_libraries(39_4_2
        Qt5::Core
        Qt5::Gui
        Qt5::Widgets
        )
