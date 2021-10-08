#
# Copyright (C) 2018 The LineageOS Project
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
#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Device Path
DEVICE_PATH := device/xiaomi/lavender

# Board
PRODUCT_USES_QCOM_HARDWARE := true
PRODUCT_BOARD_PLATFORM := sdm660

# Enable updating of APEXes
TARGET_SUPPORTS_UPDATABLE_APEX := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product-if-exists, vendor/prebuilts/config/apex.mk)

# Inherit properties ($PATH_PROP)
TARGET_ODM_PROP += $(DEVICE_PATH)/configs/props/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/configs/props/product.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/configs/props/system.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/configs/props/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/props/vendor.prop

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@4.0-impl \
    android.hardware.audio.effect@4.0-impl \
    android.hardware.audio.effect@2.0-service \
    android.hardware.audio.service \
    audio.a2dp.default \
    audio.primary.sdm660 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libhdmiedid \
    libhfp \
    libsndmonitor \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libvolumelistener

# Audio Configs
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/audio_configs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_configs.xml \
    $(DEVICE_PATH)/configs/audio/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(DEVICE_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(DEVICE_PATH)/configs/audio/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    $(DEVICE_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_configuration.xml \
    $(DEVICE_PATH)/configs/audio/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(DEVICE_PATH)/configs/audio/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/graphite_ipc_platform_info.xml \
    $(DEVICE_PATH)/configs/audio/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml \
    $(DEVICE_PATH)/configs/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(DEVICE_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Audio Policy
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    antradio_app \
    libantradio

# AuthSecret
PRODUCT_PACKAGES += \
    android.hardware.authsecret@1.0-service

# ATRACE_HAL
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

# Biometrics
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.xiaomi_sdm660

# Bluetooth
PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    android.hardware.bluetooth.audio@2.0-impl \
    BluetoothQti \
    com.qualcomm.qti.bluetooth_audio@1.0.vendor \
    libbluetooth_qti \
    libbthost_if \
    libhdmiedid \
    libhfp \
    libldacBT_dec \
    libsndmonitor \
    vendor.qti.hardware.btconfigstore@1.0.vendor

# Boot animation
TARGET_BOOTANIMATION_SIZE := 1080
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.device@3.4 \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    android.hardware.camera.provider@2.5 \
    vendor.qti.hardware.camera.device@1.0

# Codec2 modules
PRODUCT_PACKAGES += \
    com.android.media.swcodec \
    libsfplugin_ccodec

# Component overrides
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/component-overrides.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/component-overrides.xml

# Connectivity Engine support (CNE)
PRODUCT_PACKAGES += \
    cneapiclient \
    com.quicinc.cne \
    services-ext

# Consumerir
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

# Configstore
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.1-service

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk )

# Display
PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0 \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    gralloc.sdm660 \
    hwcomposer.sdm660 \
    memtrack.sdm660 \
    libdisplayconfig \
    libdisplayconfig.qti.vendor \
    libqdMetaData \
    libqdMetaData.system \
    libstagefright_enc_common \
    libtinyxml \
    vendor.display.config@2.0 \
    vendor.display.config@2.0.vendor

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.3-service.clearkey

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio \
    qcom.fmradio.xml

# Freeform Multiwindow
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml

# Fstab
PRODUCT_PACKAGES += \
    fstab.qcom

# fwk-detect
PRODUCT_PACKAGES += \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor

# GMS
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# GPS / Location
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1-impl-qti \
    android.hardware.gnss@2.1-service-qti \
    libbatching \
    libgeofencing \
    libgnss \
    libsensorndkbridge \
    libwifi-hal-ctrl

# GPS Config
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/gps/etc/apdr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/apdr.conf \
    $(DEVICE_PATH)/gps/etc/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(DEVICE_PATH)/gps/etc/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(DEVICE_PATH)/gps/etc/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
    $(DEVICE_PATH)/gps/etc/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf \
    $(DEVICE_PATH)/gps/etc/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf \
    $(DEVICE_PATH)/gps/etc/xtwifi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/xtwifi.conf \
    $(DEVICE_PATH)/gps/etc/gnss_antenna_info.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gnss_antenna_info.conf \
    $(DEVICE_PATH)/gps/etc/seccomp_policy/gnss@2.0-base.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/gnss@2.0-base.policy \
    $(DEVICE_PATH)/gps/etc/seccomp_policy/gnss@2.0-xtra-daemon.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/gnss@2.0-xtra-daemon.policy \
    $(DEVICE_PATH)/gps/etc/seccomp_policy/gnss@2.0-xtwifi-client.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/gnss@2.0-xtwifi-client.policy \
    $(DEVICE_PATH)/gps/etc/seccomp_policy/gnss@2.0-xtwifi-inet-agent.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/gnss@2.0-xtwifi-inet-agent.policy

# Healthd
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-qti \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0.vendor \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1.vendor \
    android.hardware.bluetooth@1.0.vendor \
    android.frameworks.displayservice@1.0.vendor \
    android.hardware.drm@1.3.vendor \
    android.hardware.gatekeeper@1.0.vendor \
    android.hardware.media.c2@1.0.vendor \
    android.hardware.media.c2@1.1.vendor \
    android.hardware.neuralnetworks@1.3.vendor \
    android.hardware.keymaster@4.0.vendor \
    android.hardware.radio.config@1.2.vendor \
    android.hardware.radio@1.4.vendor \
    android.hardware.radio.deprecated@1.0.vendor \
    android.hardware.secure_element@1.0.vendor \
    android.system.net.netd@1.1.vendor \
    android.hardware.gnss@2.1.vendor

# IDC
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc \
    $(DEVICE_PATH)/configs/idc/uinput-goodix.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-goodix.idc

# IFAAService
PRODUCT_PACKAGES += \
    IFAAService \
    org.ifaa.android.manager

# IFAA JAR
PRODUCT_BOOT_JARS += \
    org.ifaa.android.manager

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common_system \
    ims_ext_common.xml \

# IMS JAR
PRODUCT_BOOT_JARS += \
    ims-ext-common_system

# Init
PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.goodix.sh \
    init.msm.usb.configfs.rc \
    init.qcom.post_boot.sh \
    init.qcom.early_boot.sh \
    init.qcom.rc \
    init.qcom.sh \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    init.recovery.qcom.rc \
    init.target.rc \
    init.xiaomi_parts.rc \
    init.verity.rc \
    ueventd.qcom.rc \
    apex_metadata.rc

# Ion
PRODUCT_PACKAGES += \
    libion

# IRQ
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# IRSC
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Keylayout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(DEVICE_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-goodix.kl \
    $(DEVICE_PATH)/configs/keylayout/sdm660-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/sdm660-snd-card_Button_Jack.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.xiaomi_sdm660

# Media
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(DEVICE_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Media Google
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# OMX
PRODUCT_PACKAGES += \
    libavservices_minijail \
    libavservices_minijail.vendor \
    libc2dcolorconvert \
    libhypv_intercept \
    libmm-omxcore \
    libOmxCore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-lavender \
    $(DEVICE_PATH)/overlay-xd

# QTI Bluetooth
include vendor/qcom/opensource/commonsys-intf/bluetooth/bt-commonsys-intf-board.mk
$(call inherit-product, vendor/qcom/opensource/commonsys-intf/bluetooth/bt-system-opensource-product.mk)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.webview.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.webview.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_0_3.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml

# Power
PRODUCT_PACKAGES += \
    xyz_xyzuan.android.hardware.power@1.3-service.xiaomi_lavender-libperfmgr \
    android.hardware.power.stats@1.0-service.mock

# Powerhint
    PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/xyz-power/lavender_powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Preopt SystemUI
PRODUCT_DEXPREOPT_SPEED_APPS += SystemUI

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-vendorcompat \
    libprotobuf-cpp-lite-vendorcompat

# Privapp-Permissions
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/privapp-permission/privapp-permissions-qti-system-ext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-qti.xml \
    $(DEVICE_PATH)/configs/privapp-permission/privapp-permissions-qti-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml

# Public Libraries
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Low power Whitelist
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml \

# QMI
PRODUCT_PACKAGES += \
    libjson

# QTI Performance
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/perf/perf-profile0.conf:$(TARGET_COPY_OUT_VENDOR)/etc/perf/perf-profile0.conf \
    $(DEVICE_PATH)/configs/perf/perfconfigstore.xml:$(TARGET_COPY_OUT_VENDOR)/etc/perf/perfconfigstore.xml

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio@1.4 \
    android.hardware.radio@1.2 \
    android.hardware.radio.config@1.1 \
    android.hardware.secure_element@1.0 \
    librmnetctl \
    libxml2 \
    libprotobuf-cpp-full \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    rild \
    telephony-ext

# Ramdisk
PRODUCT_PACKAGES += \
    init.device.rc

# Recovery
PRODUCT_PACKAGES += \
    librecovery_updater_lavender

# RIL JAR
PRODUCT_BOOT_JARS += \
    telephony-ext

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(DEVICE_PATH)/seccomp/mediaextractor-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Sensors
PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0 \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    libsensorndkbridge

# Sensor Config
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    $(DEVICE_PATH)/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf \
    $(DEVICE_PATH)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    $(DEVICE_PATH)/sensors/elliptic.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/elliptic.conf

# Security Patch
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Shims
PRODUCT_PACKAGES += \
    camera.sdm660_shim

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Shims
PRODUCT_PACKAGES += \
    libcutils_shim

# Tetheroffload
PRODUCT_PACKAGES += \
    ipacm \
    ipacm.rc \
    IPACM_cfg.xml \
    libipanat \
    liboffloadhal

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@1.0-service \
    thermal.sdm660

# Thermal Controller
PRODUCT_PACKAGES += \
   ThermalController

# Thermal Conf
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/thermal/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf \
    $(DEVICE_PATH)/configs/thermal/thermal-engine-battery.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-battery.conf \
    $(DEVICE_PATH)/configs/thermal/thermal-engine-battery2.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-battery2.conf \
    $(DEVICE_PATH)/configs/thermal/thermal-engine-default.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-default.conf \
    $(DEVICE_PATH)/configs/thermal/thermal-engine-gameing.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-gameing.conf \
    $(DEVICE_PATH)/configs/thermal/thermal-engine-map.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-map.conf \
    $(DEVICE_PATH)/configs/thermal/thermal-engine-performance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-performance.conf

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.xiaomi_sdm660

# Vibrator
PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml

# VNDK
PRODUCT_PACKAGES += \
    libdng_sdk.vendor_32 \
    libstdc++.vendor_32  \
    vndk-ext \
    com.android.vndk.current.on_vendor

PRODUCT_COPY_FILES += \
    prebuilts/vndk/v29/arm64/arch-arm64-armv8-a/shared/vndk-core/libprotobuf-cpp-full.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libprotobuf-cpp-full-v29.so \
    prebuilts/vndk/v29/arm64/arch-arm64-armv8-a/shared/vndk-core/libprotobuf-cpp-lite.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libprotobuf-cpp-lite-v29.so

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwifi-hal-qcom \
    TetheringConfigOverlay \
    WifiOverlay \
    wpa_supplicant \
    wpa_supplicant.conf \
    wpa_cli

# WiFi Configs
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/wifi/hostapd.accept:$(TARGET_COPY_OUT_VENDOR)/etc/hostapd/hostapd.accept \
    $(DEVICE_PATH)/configs/wifi/hostapd.conf:$(TARGET_COPY_OUT_VENDOR)/etc/hostapd/hostapd_default.conf \
    $(DEVICE_PATH)/configs/wifi/hostapd.deny:$(TARGET_COPY_OUT_VENDOR)/etc/hostapd/hostapd.deny \
    $(DEVICE_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(DEVICE_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# WiFi Display
PRODUCT_PACKAGES += \
    libaacwrapper \
    libnl

# WiFi Display JAR
PRODUCT_BOOT_JARS += \
    WfdCommon

# xRageControl
PRODUCT_PACKAGES += \
   xRage
