# Copyright 2006 The Android Open Source Project

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_VENDOR_MODULE := true
LOCAL_SRC_FILES:= secril_shim.cpp
LOCAL_MODULE := libshim_secril

include $(BUILD_SHARED_LIBRARY)
