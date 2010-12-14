include theos/makefiles/common.mk

BUNDLE_NAME = BrightnessActivatorAction
BrightnessActivatorAction_FILES = BrightnessActivatorAction.mm
BrightnessActivatorAction_INSTALL_PATH = /Library/PreferenceBundles
BrightnessActivatorAction_FRAMEWORKS = UIKit
BrightnessActivatorAction_PRIVATE_FRAMEWORKS = Preferences

include $(FW_MAKEDIR)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(FW_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(FW_STAGING_DIR)/Library/PreferenceLoader/Preferences/BrightnessActivatorAction.plist$(ECHO_END)
