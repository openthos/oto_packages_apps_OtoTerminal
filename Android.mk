LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

appcompat_dir := $(LOCAL_PATH)/../../../prebuilts/sdk/current/support/v7/appcompat/res

LOCAL_STATIC_JAVA_LIBRARIES := android-support-v4
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v7-appcompat
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v13

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res $(appcompat_dir)

LOCAL_AAPT_FLAGS := --auto-add-overlay
LOCAL_AAPT_FLAGS += --extra-packages android.support.v7.appcompat

LOCAL_PACKAGE_NAME := OtoTerminal
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true

LOCAL_JNI_SHARED_LIBRARIES := libjackpal-termexec2 libjackpal-androidterm5

include $(BUILD_PACKAGE)

# libjackpal-termexec2
include $(CLEAR_VARS)

LOCAL_LDFLAGS   := -Wl,--build-id
LOCAL_LDLIBS := \
        -llog \
        -lc \
        -lm \

LOCAL_SHARED_LIBRARIES += liblog

LOCAL_MODULE    := libjackpal-termexec2
LOCAL_SRC_FILES := \
              jni/process.cpp \

LOCAL_C_INCLUDES += /jni

LOCAL_CFLAGS    += -ffast-math -O3 -funroll-loops

LOCAL_ARM_MODE := x86_64

include $(BUILD_SHARED_LIBRARY)

# libjackpal-androidterm5
include $(CLEAR_VARS)

LOCAL_LDFLAGS   := -Wl,--build-id
LOCAL_MODULE    := libjackpal-androidterm5
LOCAL_LDLIBS := \
        -llog \
        -lc \
        -lm \

LOCAL_SHARED_LIBRARIES += liblog

LOCAL_SRC_FILES := \
              jni/fileCompat.cpp \
              jni/termExec.cpp \
              jni/common.cpp \

LOCAL_C_INCLUDES += /jni

LOCAL_CFLAGS    += -ffast-math -O3 -funroll-loops

LOCAL_ARM_MODE := x86_64

include $(BUILD_SHARED_LIBRARY)

ifeq (,$(ONE_SHOT_MAKEFILE))
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
