echo "echo Restoring environment" > "/home/user/P/conanFuzzExample/examplePkg/test_package/build/Release/generators/deactivate_conanrunenv-release-x86_64.sh"
for v in LD_LIBRARY_PATH DYLD_LIBRARY_PATH
do
    is_defined="true"
    value=$(printenv $v) || is_defined="" || true
    if [ -n "$value" ] || [ -n "$is_defined" ]
    then
        echo export "$v='$value'" >> "/home/user/P/conanFuzzExample/examplePkg/test_package/build/Release/generators/deactivate_conanrunenv-release-x86_64.sh"
    else
        echo unset $v >> "/home/user/P/conanFuzzExample/examplePkg/test_package/build/Release/generators/deactivate_conanrunenv-release-x86_64.sh"
    fi
done


export LD_LIBRARY_PATH="/home/user/.conan/data/examplePkg/1.0/demo/testing/package/24d596ecc3e7cfef35630620092c5615473ba82a/lib:$LD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/home/user/.conan/data/examplePkg/1.0/demo/testing/package/24d596ecc3e7cfef35630620092c5615473ba82a/lib:$DYLD_LIBRARY_PATH"