# CMAKE generated file: DO NOT EDIT!
# Generated by "NMake Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF
SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2020.2.4\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2020.2.4\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\nabab\Documents\GitHub\Windows-Process-Injection

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\nabab\Documents\GitHub\Windows-Process-Injection\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles\Windows_Process_Injection.dir\depend.make

# Include the progress variables for this target.
include CMakeFiles\Windows_Process_Injection.dir\progress.make

# Include the compile flags for this target's objects.
include CMakeFiles\Windows_Process_Injection.dir\flags.make

CMakeFiles\Windows_Process_Injection.dir\main.c.obj: CMakeFiles\Windows_Process_Injection.dir\flags.make
CMakeFiles\Windows_Process_Injection.dir\main.c.obj: ..\main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\nabab\Documents\GitHub\Windows-Process-Injection\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/Windows_Process_Injection.dir/main.c.obj"
	C:\PROGRA~2\MICROS~2\2019\COMMUN~1\VC\Tools\MSVC\1428~1.293\bin\Hostx86\x86\cl.exe @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) /FoCMakeFiles\Windows_Process_Injection.dir\main.c.obj /FdCMakeFiles\Windows_Process_Injection.dir\ /FS -c C:\Users\nabab\Documents\GitHub\Windows-Process-Injection\main.c
<<

CMakeFiles\Windows_Process_Injection.dir\main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Windows_Process_Injection.dir/main.c.i"
	C:\PROGRA~2\MICROS~2\2019\COMMUN~1\VC\Tools\MSVC\1428~1.293\bin\Hostx86\x86\cl.exe > CMakeFiles\Windows_Process_Injection.dir\main.c.i @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Users\nabab\Documents\GitHub\Windows-Process-Injection\main.c
<<

CMakeFiles\Windows_Process_Injection.dir\main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Windows_Process_Injection.dir/main.c.s"
	C:\PROGRA~2\MICROS~2\2019\COMMUN~1\VC\Tools\MSVC\1428~1.293\bin\Hostx86\x86\cl.exe @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) /FoNUL /FAs /FaCMakeFiles\Windows_Process_Injection.dir\main.c.s /c C:\Users\nabab\Documents\GitHub\Windows-Process-Injection\main.c
<<

# Object files for target Windows_Process_Injection
Windows_Process_Injection_OBJECTS = \
"CMakeFiles\Windows_Process_Injection.dir\main.c.obj"

# External object files for target Windows_Process_Injection
Windows_Process_Injection_EXTERNAL_OBJECTS =

Windows_Process_Injection.exe: CMakeFiles\Windows_Process_Injection.dir\main.c.obj
Windows_Process_Injection.exe: CMakeFiles\Windows_Process_Injection.dir\build.make
Windows_Process_Injection.exe: CMakeFiles\Windows_Process_Injection.dir\objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\nabab\Documents\GitHub\Windows-Process-Injection\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable Windows_Process_Injection.exe"
	"C:\Program Files\JetBrains\CLion 2020.2.4\bin\cmake\win\bin\cmake.exe" -E vs_link_exe --intdir=CMakeFiles\Windows_Process_Injection.dir --rc=C:\PROGRA~2\WI3CF2~1\10\bin\100183~1.0\x86\rc.exe --mt=C:\PROGRA~2\WI3CF2~1\10\bin\100183~1.0\x86\mt.exe --manifests  -- C:\PROGRA~2\MICROS~2\2019\COMMUN~1\VC\Tools\MSVC\1428~1.293\bin\Hostx86\x86\link.exe /nologo @CMakeFiles\Windows_Process_Injection.dir\objects1.rsp @<<
 /out:Windows_Process_Injection.exe /implib:Windows_Process_Injection.lib /pdb:C:\Users\nabab\Documents\GitHub\Windows-Process-Injection\cmake-build-debug\Windows_Process_Injection.pdb /version:0.0  /machine:X86 /debug /INCREMENTAL /subsystem:console  kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib 
<<

# Rule to build all files generated by this target.
CMakeFiles\Windows_Process_Injection.dir\build: Windows_Process_Injection.exe

.PHONY : CMakeFiles\Windows_Process_Injection.dir\build

CMakeFiles\Windows_Process_Injection.dir\clean:
	$(CMAKE_COMMAND) -P CMakeFiles\Windows_Process_Injection.dir\cmake_clean.cmake
.PHONY : CMakeFiles\Windows_Process_Injection.dir\clean

CMakeFiles\Windows_Process_Injection.dir\depend:
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles" C:\Users\nabab\Documents\GitHub\Windows-Process-Injection C:\Users\nabab\Documents\GitHub\Windows-Process-Injection C:\Users\nabab\Documents\GitHub\Windows-Process-Injection\cmake-build-debug C:\Users\nabab\Documents\GitHub\Windows-Process-Injection\cmake-build-debug C:\Users\nabab\Documents\GitHub\Windows-Process-Injection\cmake-build-debug\CMakeFiles\Windows_Process_Injection.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles\Windows_Process_Injection.dir\depend
