echo "echo Restoring environment" > "/home/user/P/conanFuzzExample/examplePkg/test_package/build/Release/generators/deactivate_conanbuildenv-release-x86_64.sh"
for v in 
do
    is_defined="true"
    value=$(printenv $v) || is_defined="" || true
    if [ -n "$value" ] || [ -n "$is_defined" ]
    then
        echo export "$v='$value'" >> "/home/user/P/conanFuzzExample/examplePkg/test_package/build/Release/generators/deactivate_conanbuildenv-release-x86_64.sh"
    else
        echo unset $v >> "/home/user/P/conanFuzzExample/examplePkg/test_package/build/Release/generators/deactivate_conanbuildenv-release-x86_64.sh"
    fi
done

