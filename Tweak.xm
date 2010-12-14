#import <UIKit/UIKit.h>
#import "libactivator.h"

@interface SpringBoard
- (void)setBacklightLevel:(float)level permanently:(BOOL)permanently;
- (float)currentBacklightLevel;
@end

@interface BrightnessListener : NSObject <LAListener>
{
	int status;
}
- (id)initWithStatus:(int)aStatus;
@end

@implementation BrightnessListener

- (id)initWithStatus:(int)aStatus
{
	if ((self = [super init]))
	{
		status = aStatus;
	}
	return self;
}

- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event
{
	float newBacklight = 0.75f;
	float increment = [[[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.whomer.BrightnessActivatorAction.plist"] valueForKey:@"Increment"] floatValue];
	if (increment < 0.01) increment = 0.25;
	
	if (status == 0)
		newBacklight = [(SpringBoard *)[UIApplication sharedApplication] currentBacklightLevel] + increment;
	else
		newBacklight = [(SpringBoard *)[UIApplication sharedApplication] currentBacklightLevel] - increment;
	
	if (newBacklight > 1.0f) newBacklight = 1.0f;
	else if (newBacklight <= 0.0f) newBacklight = 0.01f;
		
	[(SpringBoard *)[UIApplication sharedApplication] setBacklightLevel:newBacklight permanently:YES];
}

@end

__attribute__((constructor)) static void BAL_Main()
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	BrightnessListener *up = [[BrightnessListener alloc] initWithStatus:0];
	BrightnessListener *down = [[BrightnessListener alloc] initWithStatus:1];
	[[LAActivator sharedInstance] registerListener:up forName:@"com.whomer.brightnesslistener.up"];
	[[LAActivator sharedInstance] registerListener:down forName:@"com.whomer.brightnesslistener.down"];
	
	[pool release];
}