include theos/makefiles/common.mk

TWEAK_NAME = BrightnessActivator
BrightnessActivator_FILES = Tweak.xm
BrightnessActivator_FRAMEWORKS = Foundation UIKit
BrightnessActivator_LDFLAGS = -lactivator -Llib/

include $(FW_MAKEDIR)/tweak.mk
