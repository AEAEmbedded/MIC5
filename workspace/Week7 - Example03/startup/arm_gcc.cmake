#[[
  Copyright 2023 (C) Richard Kroesen <kroesen.ri@gmail.com> & Victor Hogeweij <hogeweyv@gmail.com>

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
]]

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)
if(${CMAKE_VERSION} VERSION_LESS "3.16.0")
    message(WARNING "Current CMake version is ${CMAKE_VERSION}. KL25Z-cmake requires CMake 3.16 or greater")

endif()

set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")


set(CMAKE_OBJCOPY arm-none-eabi-objcopy)
set(CMAKE_OBJDUMP arm-none-eabi-objdump)
set(SIZE arm-none-eabi-size)
set(MCPU cortex-m0plus)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)


add_compile_options(-mcpu=${MCPU} -mthumb -mthumb-interwork)
add_definitions(-DCPU_MKL25Z128VLK4 
                -DFRDM_KL25Z 
                -DFREEDOM
                -DDEBUG
                -D__USE_CMSIS
                -DCLOCK_SETUP=1
                -MMD
                -MP
                -fno-common 
                -g3 
                -gdwarf-4 
                -Wall 
                -fmessage-length=0 
                -fno-builtin 
                -ffunction-sections 
                -fdata-sections 
                -fmerge-constants
                -mapcs)
                
add_link_options(-mthumb
                -mcpu=${MCPU}
                -specs=nano.specs 
                -Wl,--gc-sections
                --specs=nosys.specs
                -Wl,--print-memory-usage
                -lm
                -Wl,-Map=${PROJECT_BINARY_DIR}/${PROJECT_NAME}.map)

set(LINKER_SCRIPT ${CMAKE_CURRENT_LIST_DIR}/linker_script.ld)
add_link_options(-T ${LINKER_SCRIPT} -static)
