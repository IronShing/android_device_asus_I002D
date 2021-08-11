LOCAL_PATH := $(call my-dir)

ifneq ($(filter I002D,$(TARGET_DEVICE)),)

    subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
    $(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

include $(CLEAR_VARS)
IMS_LIBS := libimscamera_jni.so libimsmedia_jni.so
IMS_SYMLINKS := $(addprefix $(TARGET_OUT_SYSTEM_EXT_APPS_PRIVILEGED)/ims/lib/arm64/,$(notdir $(IMS_LIBS)))
$(IMS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "IMS lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system_ext/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(IMS_SYMLINKS)

include $(CLEAR_VARS)
SYSHELPER_LIBS := libsystemhelper_jni.so
SYSHELPER_SYMLINKS := $(addprefix $(TARGET_OUT_SYSTEM_EXT_APPS)/com.qualcomm.qti.services.systemhelper/lib/arm64/,$(notdir $(SYSHELPER_LIBS)))
$(SYSHELPER_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "System Helper lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system_ext/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(SYSHELPER_SYMLINKS)

endif
