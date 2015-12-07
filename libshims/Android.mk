LOCAL_PATH := $(call my-dir)

# Shim lib 
# Created by sirmordred

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
     binder/MemoryHeapPmem.cpp \
	 binder/IMemory.cpp \
	 binder/MemoryHeapBase.cpp \
	 ui/Overlay.cpp \
     mediaplayer.cpp \
     VectorImpl.cpp

LOCAL_WHOLE_STATIC_LIBRARIES := liblog libcutils libhardware libui libgui libbinder libutils libmedia libsync

LOCAL_C_INCLUDES += \
	$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES :=  \
	$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_MODULE := libshims

include $(BUILD_SHARED_LIBRARY)