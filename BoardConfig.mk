# Copyright (C) 2012 The CyanogenMod Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from the proprietary version

TARGET_SPECIFIC_HEADER_PATH += device/samsung/ancora/include

# Platform
TARGET_BOARD_PLATFORM := msm7x30
TARGET_BOOTLOADER_BOARD_NAME := ancora
TARGET_OTA_ASSERT_DEVICE := ancora,GT-I8150
TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := scorpion
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := false

# Enable dex-preoptimization to speed up first boot sequence
#WITH_DEXPREOPT := true

# Low-ram
MALLOC_SVELTE := true

# For legacy binaries
BOARD_USES_LEGACY_MMAP := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_NEEDS_GCC_LIBC := true

# Don't try to build and run all tests by default. Several tests have
# dependencies on the framework.
ANDROID_NO_TEST_CHECK := true

# Kernel
BOARD_KERNEL_BASE := 0x00400000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_SOURCE := kernel/samsung/msm7x30-common
TARGET_KERNEL_CONFIG := ancora_defconfig

# Wifi related defines
WIFI_BAND                        := 802_11_ABG
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_HAVE_SAMSUNG_WIFI          := true

WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME          := "dhd"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/vendor/firmware/fw_bcmdhd.bin nvram_path=/vendor/firmware/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG        := "firmware_path=/vendor/firmware/fw_bcmdhd_apsta.bin nvram_path=/vendor/firmware/nvram_net.txt"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcmdhd_apsta.bin"

# Healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.msm

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/ancora/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/samsung/ancora/bluetooth/vnd_ancora.txt

# RIL
LINKER_NON_PIE_EXECUTABLES_HEADER_DIR := $(TARGET_SPECIFIC_HEADER_PATH)
BOARD_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING
TARGET_NEEDS_BIONIC_PRELINK_SUPPORT := true
BOARD_RIL_CLASS := ../../../device/samsung/ancora/ril/

# Audio
BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_HAVE_SAMSUNG_AUDIO := true
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := false
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := false

# Qualcomm
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_DISPLAY_INSECURE_MM_HEAP := true
BOARD_USES_QCOM_HARDWARE := true

# Triple FrameBuffer
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
USE_DEVICE_SPECIFIC_CAMERA := true
BOARD_GLOBAL_CFLAGS += -DBINDER_COMPAT
#BOARD_GLOBAL_CFLAGS += -DDECAY_TIME_DEFAULT=0
BOARD_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# This will disable legacy hacks in libstagefright(fw/av/media/libstagefright/Android.mk) but our SKIP_SET_BUFFER_MODE define will still be enabled
#TARGET_USES_MEDIA_EXTENSIONS := true

# Light HAL
TARGET_PROVIDES_LIBLIGHT := true

# CM Hardware
BOARD_HARDWARE_CLASS := device/samsung/ancora/cmhw

# GPS
USE_DEVICE_SPECIFIC_GPS := true

# Recovery
LZMA_RAMDISK_TARGETS := recovery
TARGET_RECOVERY_FSTAB := device/samsung/ancora/rootdir/fstab.qcom

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 5767168
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 7864320
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1163919360
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1832894464
BOARD_CACHEIMAGE_PARTITION_SIZE := 560988160
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

# Misc. filesystem settings
BOARD_NO_SECURE_DISCARD := true
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Charger
WITH_CM_CHARGER := false
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_ENABLE_SUSPEND := true

# SELinux
#BOARD_SEPOLICY_DIRS += \
#    device/samsung/ancora/sepolicy

ifeq ($(WITH_TWRP),true)
-include device/samsung/ancora/twrp.mk
endif
