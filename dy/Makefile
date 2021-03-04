include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = dy
dy_FILES = dyRootListController.m
dy_INSTALL_PATH = /Library/PreferenceBundles
dy_FRAMEWORKS = UIKit
dy_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/dy.plist$(ECHO_END)
