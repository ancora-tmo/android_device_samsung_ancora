LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := camera.$(TARGET_BOARD_PLATFORM)

LOCAL_SRC_FILES := \
    cameraHAL.cpp \
    Overlay.cpp


LOCAL_C_INCLUDES := $(TOP)/frameworks/native/include

LOCAL_C_INCLUDES += $(call project-path-for,qcom-display)/libgralloc \
                    system/media/camera/include

LOCAL_MODULE_TAGS := optional

# Disable clang for now until the fix = CameraHardwareInterface.h:236:40: error: 'SEC_openCameraHardware' has C-linkage specified, but returns incomplete type 'sp<android::CameraHardwareInterface>' which could be incompatible with C [-Werror,-Wreturn-type-c-linkage]
LOCAL_CLANG := false
# Or disable -Werror=return-type in build/core/config.mk

LOCAL_SHARED_LIBRARIES := liblog libutils libhardware libcamera_client
LOCAL_SHARED_LIBRARIES += libseccameraadaptor

include $(BUILD_SHARED_LIBRARY)
