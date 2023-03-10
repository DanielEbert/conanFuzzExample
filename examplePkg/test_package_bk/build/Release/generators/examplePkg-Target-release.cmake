# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(examplePkg_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(examplePkg_FRAMEWORKS_FOUND_RELEASE "${examplePkg_FRAMEWORKS_RELEASE}" "${examplePkg_FRAMEWORK_DIRS_RELEASE}")

set(examplePkg_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET examplePkg_DEPS_TARGET)
    add_library(examplePkg_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET examplePkg_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${examplePkg_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${examplePkg_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### examplePkg_DEPS_TARGET to all of them
conan_package_library_targets("${examplePkg_LIBS_RELEASE}"    # libraries
                              "${examplePkg_LIB_DIRS_RELEASE}" # package_libdir
                              examplePkg_DEPS_TARGET
                              examplePkg_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "examplePkg")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${examplePkg_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET examplePkg::examplePkg
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${examplePkg_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${examplePkg_LIBRARIES_TARGETS}>
                 APPEND)

    if("${examplePkg_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET examplePkg::examplePkg
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     examplePkg_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET examplePkg::examplePkg
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${examplePkg_LINKER_FLAGS_RELEASE}> APPEND)
    set_property(TARGET examplePkg::examplePkg
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${examplePkg_INCLUDE_DIRS_RELEASE}> APPEND)
    set_property(TARGET examplePkg::examplePkg
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${examplePkg_COMPILE_DEFINITIONS_RELEASE}> APPEND)
    set_property(TARGET examplePkg::examplePkg
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${examplePkg_COMPILE_OPTIONS_RELEASE}> APPEND)

########## For the modules (FindXXX)
set(examplePkg_LIBRARIES_RELEASE examplePkg::examplePkg)
