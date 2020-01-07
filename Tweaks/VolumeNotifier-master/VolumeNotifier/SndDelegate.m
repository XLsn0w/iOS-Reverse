#import <AVFoundation/AVFoundation.h>
#import <objc/runtime.h>
#import "SndDelegate.h"

@implementation SndDelegate

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
	[player release];
	[self release];
}

@end