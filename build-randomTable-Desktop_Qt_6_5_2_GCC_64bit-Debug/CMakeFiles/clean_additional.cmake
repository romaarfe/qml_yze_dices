# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/apprandomTable_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/apprandomTable_autogen.dir/ParseCache.txt"
  "apprandomTable_autogen"
  )
endif()
