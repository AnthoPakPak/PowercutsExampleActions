THEOS_DEVICE_IP=192.168.3.46
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PowercutsExampleActions
PowercutsExampleActions_FILES = $(wildcard Actions/*.xm)
PowercutsExampleActions_LIBRARIES = powercuts

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
