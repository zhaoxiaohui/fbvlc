#/**********************************************************\ 
# Auto-generated Mac project definition file for the
# FireBreathed VLC project
#\**********************************************************/

# Mac template platform definition CMake file
# Included from ../CMakeLists.txt

# remember that the current source dir is the project root; this file is in Mac/
file( GLOB PLATFORM RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    Mac/[^.]*.cpp
    Mac/[^.]*.h
    Mac/[^.]*.cmake
    )

set( VLC_PATH "${CMAKE_CURRENT_SOURCE_DIR}/Mac/VLC-${VLC_VERSION}.app/Contents/MacOS" )

file( GLOB LIBVLC_LIB ${VLC_PATH}/lib/[^.]*.dylib )
file( GLOB LIBVLC_PLUGINS ${VLC_PATH}/plugins/[^.]*.dylib )

set( LIBVLC ${LIBVLC_LIB} ${LIBVLC_PLUGINS} )

set_source_files_properties(
    ${LIBVLC_LIB}
    PROPERTIES
    MACOSX_PACKAGE_LOCATION MacOS/lib
)

set_source_files_properties(
    ${LIBVLC_PLUGINS}
    PROPERTIES
    MACOSX_PACKAGE_LOCATION MacOS/plugins
)

include_directories( ${VLC_PATH}/include )

# use this to add preprocessor definitions
add_definitions(
    
)

source_group( Libvlc FILES ${LIBVLC} )

source_group( Mac FILES ${PLATFORM} )

set (SOURCES
    ${SOURCES}
    ${PLATFORM}
    ${LIBVLC}
    )

set(PLIST "Mac/bundle_template/Info.plist")
set(STRINGS "Mac/bundle_template/InfoPlist.strings")
set(LOCALIZED "Mac/bundle_template/Localized.r")

add_mac_plugin( ${PROJECT_NAME} ${PLIST} ${STRINGS} ${LOCALIZED} SOURCES )

# add library dependencies here; leave ${PLUGIN_INTERNAL_DEPS} there unless you know what you're doing!
target_link_libraries( ${PROJECT_NAME}
    ${PLUGIN_INTERNAL_DEPS}
    "${VLC_PATH}/lib/libvlc.dylib"
    )

#To create a DMG, include the following file
include(Mac/installer.cmake)
