export THEOS=/opt/theos/
export ARCHS = arm64 arm64e
include $(THEOS)/makefiles/common.mk
THEOS_PLATFORM_DEB_COMPRESSION_LEVEL = 6

TWEAK_NAME = ️dy
️dy_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += dy
include $(THEOS_MAKE_PATH)/aggregate.mk