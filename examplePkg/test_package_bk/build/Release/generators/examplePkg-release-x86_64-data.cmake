########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(examplePkg_COMPONENT_NAMES "")
set(examplePkg_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(examplePkg_PACKAGE_FOLDER_RELEASE "/home/user/.conan/data/examplePkg/1.0/demo/testing/package/24d596ecc3e7cfef35630620092c5615473ba82a")
set(examplePkg_BUILD_MODULES_PATHS_RELEASE )


set(examplePkg_INCLUDE_DIRS_RELEASE "${examplePkg_PACKAGE_FOLDER_RELEASE}/include")
set(examplePkg_RES_DIRS_RELEASE )
set(examplePkg_DEFINITIONS_RELEASE )
set(examplePkg_SHARED_LINK_FLAGS_RELEASE "-fsanitize=fuzzer,address")
set(examplePkg_EXE_LINK_FLAGS_RELEASE "-fsanitize=fuzzer,address")
set(examplePkg_OBJECTS_RELEASE )
set(examplePkg_COMPILE_DEFINITIONS_RELEASE )
set(examplePkg_COMPILE_OPTIONS_C_RELEASE )
set(examplePkg_COMPILE_OPTIONS_CXX_RELEASE -fsanitize=fuzzer,address)
set(examplePkg_LIB_DIRS_RELEASE "${examplePkg_PACKAGE_FOLDER_RELEASE}/lib")
set(examplePkg_LIBS_RELEASE examplePkg)
set(examplePkg_SYSTEM_LIBS_RELEASE )
set(examplePkg_FRAMEWORK_DIRS_RELEASE )
set(examplePkg_FRAMEWORKS_RELEASE )
set(examplePkg_BUILD_DIRS_RELEASE "${examplePkg_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(examplePkg_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${examplePkg_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${examplePkg_COMPILE_OPTIONS_C_RELEASE}>")
set(examplePkg_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${examplePkg_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${examplePkg_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${examplePkg_EXE_LINK_FLAGS_RELEASE}>")


set(examplePkg_COMPONENTS_RELEASE )