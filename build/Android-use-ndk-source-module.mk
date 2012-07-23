LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := demo
LOCAL_SRC_FILES := demo.c
LOCAL_STATIC_LIBRARIES := ffmpeg
include $(BUILD_EXECUTABLE)

$(call import-module,ffmpeg)
