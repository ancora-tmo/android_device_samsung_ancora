LOCAL_PATH := $(call my-dir)

# Shim lib 
# Created by sirmordred

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	 ui/Overlay.cpp \
     MemoryHeapPmem.cpp \
     mediaplayer.cpp \
     VectorImpl.c

LOCAL_WHOLE_STATIC_LIBRARIES := liblog libcutils libhardware libui libgui libbinder libutils libmedia libsync

LOCAL_C_INCLUDES += \
	$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES :=  \
	$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_MODULE := libshim

include $(BUILD_SHARED_LIBRARY)