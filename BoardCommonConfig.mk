#
# Copyright (C) 2012 The Android Open-Source Project
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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_LEGACY_MMAP := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_VARIANT := cortex-a9
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_64_BIT_BINDER := true

BOARD_GLOBAL_CFLAGS += -Ofast -march=armv7-a+simd -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp -funsafe-math-optimizations -frename-registers -funroll-loops -fopenmp --param l1-cache-line-size=32 --param l1-cache-size=32 --param l2-cache-size=1024
BOARD_GLOBAL_CPPFLAGS += -Ofast -march=armv7-a+simd -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp -funsafe-math-optimizations -frename-registers -funroll-loops -fopenmp --param l1-cache-line-size=32 --param l1-cache-size=32 --param l2-cache-size=1024
ARM_HAVE_NEON := true
ARM_USE_PLD := true
ARM_CACHE_LINE_SIZE := 32
GLIBCXX_PARALLEL := true

BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos4
TARGET_SOC := exynos4210
TARGET_BOOTLOADER_BOARD_NAME := smdk4210

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_SEPARATE_RECOVERY := true
NEED_KERNEL_MODULE_SYSTEM := true

TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true

#BOARD_NAND_PAGE_SIZE := 4096
#BOARD_NAND_SPARE_SIZE := 128
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_IMAGE_NAME := zImage

TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Bionic
TARGET_LD_SHIM_LIBS := \
    /system/vendor/lib/libsec-ril.so|libsamsung_symbols.so

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Memory management
MALLOC_SVELTE := true

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false
      WITH_DEXPREOPT := true
    endif
  endif
endif

# Filesystem
TARGET_FS_CONFIG_GEN := device/samsung/galaxys2-common/config.fs
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147467264
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 104857600
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_ROOT_EXTRA_FOLDERS := efs misc
BOARD_ROOT_EXTRA_SYMLINKS := /data/tombstones:/tombstones

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := ./device/samsung/galaxys2-common

# Hardware tunables
BOARD_HARDWARE_CLASS := hardware/samsung/lineagehw \
    device/samsung/galaxys2-common/lineagehw

# Graphics
BOARD_EGL_CFG := device/samsung/galaxys2-common/configs/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U | 0x400U

# FIMG Acceleration
BOARD_USES_FIMGAPI := true
BOARD_USES_SKIA_FIMGAPI := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# HWComposer
BOARD_USES_HWCOMPOSER := true
BOARD_USE_SYSFS_VSYNC_NOTIFICATION := true

# HWUI
HWUI_COMPILE_FOR_PERF := true

# OMX
BOARD_NONBLOCK_MODE_PROCESS := true
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USES_MFC_FPS := false
BOARD_USE_S3D_SUPPORT := true
BOARD_USE_CSC_FIMC := false

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Audio
BOARD_USE_TINYALSA_AUDIO := true
BOARD_USE_YAMAHA_MC1N2_AUDIO := true
USE_XML_AUDIO_POLICY_CONF := 1

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := xmm6260
BOARD_RIL_CLASS := ../../../device/samsung/galaxys2-common/ril
TARGET_USES_OLD_MNC_FORMAT := true

# Camera
BOARD_CAMERA_HAVE_ISO := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# WiFi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_HAVE_SAMSUNG_WIFI := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/system/etc/wifi/bcmdhd_p2p.bin"

# Network Routing
TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := device/samsung/galaxys2-common/bluetooth/vnd_smdk4210.txt

# Selinux
#SELINUX_IGNORE_NEVERALLOWS := true
#BOARD_SEPOLICY_DIRS += device/samsung/galaxys2-common/selinux/vendor
#BOARD_PLAT_PUBLIC_SEPOLICY_DIR += device/samsung/galaxys2-common/selinux/public
#BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/samsung/galaxys2-common/selinux/private

# Recovery
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/galaxys2-common/recovery/recovery_keys.c
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/galaxys2-common/recovery/graphics.c
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_DENSITY := mdpi
RECOVERY_FSTAB_VERSION := 2

# Device specific headers
TARGET_SPECIFIC_HEADER_PATH := device/samsung/galaxys2-common/include

# Charging mode
BOARD_BATTERY_DEVICE_NAME := "battery"
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_USES_FULL_RECOVERY_IMAGE := true
WITH_LINEAGE_CHARGER := false

# Boot.img
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/galaxys2-common/shbootimg.mk

# Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.exynos4

# Use the non-open-source parts, if they're present
-include vendor/samsung/galaxys2-common/BoardConfigVendor.mk
