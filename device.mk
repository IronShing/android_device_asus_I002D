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

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Api
PRODUCT_SHIPPING_API_LEVEL := 30

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# tell update_engine to not change dynamic partition table during updates
# needed since our qti_dynamic_partitions does not include
# vendor and odm and we also dont want to AB update them
# TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant@1.0.vendor

# Atrace
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio@2.0-impl \
    android.hardware.soundtrigger@2.2-impl \
    audio.a2dp.default \
    audio.bluetooth.default \
    audio.primary.kona \
    audio.r_submix.default \
    audio.usb.default \
    audio_amplifier.kona \
    liba2dpoffload \
    libaudiopreprocessing \
    libbatterylistener \
    libbundlewrapper \
    libcirrusspkrprot \
    libcomprcapture \
    libdownmix \
    libdynproc \
    libeffectproxy \
    libexthwplugin \
    libhdmiedid \
    libhfp \
    libldnhncr \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libreverbwrapper \
    libsndmonitor \
    libspkrprot \
    libvisualizer \
    libvolumelistener \
    sound_trigger.primary.kona

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration_ZS670KS.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_ZS670KS.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes_ZS670KS.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes_ZS670KS.xml

# Bluetooth
PRODUCT_PACKAGES += \
    com.qualcomm.qti.bluetooth_audio@1.0.vendor \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    BluetoothQti

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1 \
    android.hardware.boot@1.1-impl.recovery \
    android.hardware.boot@1.1-service \
    bootctrl.kona.recovery \
    bootctrl.kona

PRODUCT_PACKAGES_DEBUG += \
    bootctl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.recovery.qcom.rc \
    fstab.qcom

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    vendor.qti.hardware.camera.device@1.0.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor

# ZenParts
PRODUCT_PACKAGES += \
    ZenParts

# Charger images
PRODUCT_PACKAGES += \
    animation.txt \
    font_charger.png

# Configstore
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.1-service \
    android.hardware.configstore@1.0-service

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.hardware.renderscript@1.0-impl \
    gralloc.kona \
    libdisplayconfig.qti.vendor \
    libqdMetaData \
    libqdutils \
    libqservice \
    libsdmcore \
    libsdmutils \
    libtinyxml \
    libvulkan \
    lights.kona \
    memtrack.kona \
    vendor.display.config@1.0.vendor \
    vendor.display.config@1.1.vendor \
    vendor.display.config@1.2.vendor \
    vendor.display.config@1.3.vendor \
    vendor.display.config@1.4.vendor \
    vendor.display.config@1.5.vendor \
    vendor.display.config@1.6.vendor \
    vendor.display.config@1.7.vendor \
    vendor.display.config@1.8.vendor \
    vendor.display.config@1.9.vendor \
    vendor.display.config@1.10.vendor \
    vendor.display.config@1.11.vendor \
    vendor.display.config@2.0.vendor \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.composer-service \
    vendor.qti.hardware.display.mapper@1.0.vendor \
    vendor.qti.hardware.display.mapper@1.1.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor

PRODUCT_PACKAGES += \
    libdisplayconfig.qti \
    vendor.display.config@1.0 \
    vendor.display.config@2.0

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.3-service.clearkey

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    libhidltransport \
    libhwbinder

PRODUCT_BOOT_JARS += android.hidl.manager-V1.0-java

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/fts_ts.idc:system/usr/idc/fts_ts.idc \
    $(LOCAL_PATH)/keychars/fts_ts.kcm:system/usr/keychars/fts_ts.kcm \
    $(LOCAL_PATH)/keylayout/fts_ts.kl:system/usr/keylayout/fts_ts.kl \
    $(LOCAL_PATH)/keylayout/Generic_zf7.kl:system/usr/keylayout/Generic_zf7.kl \
    $(LOCAL_PATH)/keylayout/goodixfp.kl:system/usr/keylayout/goodixfp.kl \
    $(LOCAL_PATH)/keylayout/i-rocks_Bluetooth_Keyboard.kl:system/usr/keylayout/i-rocks_Bluetooth_Keyboard.kl

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \
    libipanat:64 \
    liboffloadhal:64

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Netutils
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0 \
    libandroid_net

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    SecureElement \
    com.android.nfc_extras \
    libchrome.vendor \
    ese_spi_nxp \
    vendor.nxp.hardware.nfc@2.0.vendor \
    vendor.nxp.nxpese@1.0.vendor \
    vendor.nxp.nxpnfc@1.0.vendor \
    vendor.nxp.nxpnfclegacy@1.0.vendor

# Omx
PRODUCT_PACKAGES += \
    init.qti.media.sh \
    libc2dcolorconvert \
    libcodec2_hidl@1.0.vendor \
    libcodec2_vndk.vendor \
    libmm-omxcore \
    libOmxCore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw \
    libwfdaac_vendor

PRODUCT_PACKAGES += \
    libavservices_minijail \
    libavservices_minijail.vendor \
    libavservices_minijail_vendor:32

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti \
    vendor.qti.hardware.perf@2.0.vendor

# QMI
PRODUCT_PACKAGES += \
    libjson \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti \
    libvndfwk_detect_jni.qti.vendor \
    vendor.qti.hardware.systemhelper@1.0 \
    vendor.qti.hardware.systemhelper@1.0.vendor

# RIL
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librmnetctl

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.multihal \
    android.hardware.sensors@2.0-ScopedWakelock.vendor \
    libsensorndkbridge:64

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    tcmiface \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti

# Trust HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# Hotword Enrollement
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hotword-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/hotword-hiddenapi-package-whitelist.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-ASUS_I002D.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-ASUS_I002D.xml

# Update engine
PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

PRODUCT_HOST_PACKAGES += \
    brillo_update_payload

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

PRODUCT_PACKAGES += \
    vndk_package

PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.2-service-qti \
    libusb.vendor:64

# Vibrator
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/excluded-input-devices.xml:system/etc/excluded-input-devices.xml

# Wifi
PRODUCT_PACKAGES += \
    libavservices_minijail \
    libnl \
    TetheringOverlay \
    WifiOverlay

PRODUCT_BOOT_JARS += \
    WfdCommon

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwpa_client \
    libwifi-hal-ctrl \
    libwifi-hal-qcom \
    vendor.qti.hardware.fstman@1.0.vendor:64 \
    vendor.qti.hardware.wifi.hostapd@1.0.vendor \
    vendor.qti.hardware.wifi.hostapd@1.1.vendor \
    vendor.qti.hardware.wifi.hostapd@1.2.vendor \
    vendor.qti.hardware.wifi.supplicant@2.0.vendor \
    vendor.qti.hardware.wifi.supplicant@2.1.vendor \
    wpa_supplicant \
    wpa_supplicant.conf

# Inherit from vendor blobs
$(call inherit-product, vendor/asus/I002D/I002D-vendor.mk)