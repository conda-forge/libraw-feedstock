setlocal EnableDelayedExpansion

:: Copy CMake files to the source directory
xcopy /E %SRC_DIR%\cmake %SRC_DIR%

cd %SRC_DIR%
mkdir build
cd build

:: Configure using the CMakeFiles
cmake -G "NMake Makefiles" ^
      -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_BUILD_TYPE:STRING=Release ^
      ..
if errorlevel 1 exit 1
cmake --build . --config Release --target install
if errorlevel 1 exit 1