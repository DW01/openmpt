
 project "smbPitchShift"
  uuid "89AF16DD-32CC-4A7E-B219-5F117D761F9F"
  language "C++"
  location ( "../../build/" .. mpt_projectpathname .. "-ext" )
  objdir "../../build/obj/smbPitchShift"
  dofile "../../build/premake/premake-defaults-LIBorDLL.lua"
  dofile "../../build/premake/premake-defaults.lua"
  dofile "../../build/premake/premake-defaults-winver.lua"
  targetname "openmpt-smbpitchshift"
  includedirs { }
  characterset "MBCS"
  files {
   "../../include/smbPitchShift/smbPitchShift.cpp",
  }
  files {
   "../../include/smbPitchShift/smbPitchShift.h",
  }
  buildoptions { "/wd4244" }
  filter { "kind:SharedLib" }
   defines { "SMBPITCHSHIFT_BUILD_DLL" }
  filter {}
