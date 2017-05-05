LOCAL_PATH := $(call my-dir)

# Camera
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    media_shim.cpp \
    MemoryHeapPmem.cpp \
    MemoryBase.c
LOCAL_SHARED_LIBRARIES := libbinder liblog libutils libmedia
LOCAL_C_INCLUDES += external/safe-iop/include
LOCAL_MODULE := libshim_camera
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_SHARED_LIBRARY)

# RIL
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    ril_shim.cpp \
    bionic/bionic_time_conversions.cpp \
    bionic/pthread_cond.cpp
LOCAL_SHARED_LIBRARIES := libc libbinder
LOCAL_MODULE := libshim_ril
LOCAL_CLANG := false
LOCAL_CXX_STL := none
LOCAL_SANITIZE := never
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_SHARED_LIBRARY)
