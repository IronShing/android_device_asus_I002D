#
# Copyright (C) 2020 ComicoTeam
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


# Inherit from asus sm8250-common
-include device/asus/sm8250-common/BoardConfigCommon.mk

DEVICE_PATH := device/asus/I002D

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo385

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo385

TARGET_USES_64_BIT_BINDER := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Extra Folders
BOARD_ROOT_EXTRA_FOLDERS += motor_fw1 motor_fw2

# Kernel
TARGET_KERNEL_SOURCE := kernel/asus/tequila
TARGET_KERNEL_CONFIG := vendor/tequila_defconfig

# Properties
TARGET_OTA_ASSERT_DEVICE := I002D, WW_I002D, ASUS_I002D
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Sepolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private

# inherit from the proprietary version
-include vendor/asus/I002D/BoardConfigVendor.mk
