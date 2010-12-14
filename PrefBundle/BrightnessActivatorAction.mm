#import <Preferences/Preferences.h>

@interface BrightnessActivatorActionListController: PSListController {
}
@end

@implementation BrightnessActivatorActionListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"BrightnessActivatorAction" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
