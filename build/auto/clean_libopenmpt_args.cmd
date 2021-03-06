@echo off

set BATCH_DIR=%~dp0
cd %BATCH_DIR%
cd ..\..

set MY_DIR=%CD%

call "build\auto\setup_arguments.cmd" %1 %2 %3 %4 %5 %6

call "build\auto\setup_%MPT_VS_VER%.cmd"



cd "build\%MPT_VS_WITHTARGET%" || goto error

 devenv libopenmpt_test.sln /clean "Release|%MPT_VS_ARCH%" || goto error

 devenv libopenmpt.sln /clean "Release|%MPT_VS_ARCH%" || goto error
 devenv openmpt123.sln /clean "Release|%MPT_VS_ARCH%" || goto error
 if "%MPT_VS_ARCH%" == "Win32" (
  devenv in_openmpt.sln /clean "Release|%MPT_VS_ARCH%" || goto error
  devenv xmp-openmpt.sln /clean "Release|%MPT_VS_ARCH%" || goto error
  devenv foo_openmpt.sln /clean "Release|%MPT_VS_ARCH%" || goto error
 )
 devenv libopenmpt.sln /clean "ReleaseShared|%MPT_VS_ARCH%" || goto error
 
cd ..\.. || goto error



goto noerror

:error
cd "%MY_DIR%"
exit 1

:noerror
cd "%MY_DIR%"
exit 0
