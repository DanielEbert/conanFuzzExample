from conan import ConanFile
from conan.tools.cmake import CMakeToolchain, CMake, cmake_layout


class ExamplePkgConan(ConanFile):
    name = "examplePkg"
    version = "1.0"

    # Binary configuration
    settings = "os", "compiler", "build_type", "arch"
    options = {"shared": [True, False], "fPIC": [True, False]}
    default_options = {"shared": False, "fPIC": True}

    # Sources are located in the same place as this recipe, copy them to the recipe
    exports_sources = "CMakeLists.txt", "src/*", "include/*"

    def layout(self):
        cmake_layout(self)

    def generate(self):
        tc = CMakeToolchain(self)
        tc.generate()

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

    def package(self):
        cmake = CMake(self)
        cmake.install()
        self.copy('*', src='include', dst='include')

    def package_info(self):
        self.cpp_info.libs = ["examplePkg"]
        # if self.options.fuzzing:
        self.cpp_info.cppflags = ['-fsanitize=fuzzer,address']
        # I'm not sure if we need the following line:
        self.cpp_info.sharedlinkflags = ['-fsanitize=fuzzer,address']
        self.cpp_info.exelinkflags = ['-fsanitize=fuzzer,address']
