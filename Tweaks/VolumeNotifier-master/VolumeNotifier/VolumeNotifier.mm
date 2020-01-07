#line 1 "/Users/Zheng/Projects/VolumeNotifier/VolumeNotifier/VolumeNotifier.xm"
#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <SndDelegate.h>
#import <VolumeNotifier.h>

#define DEFAULT_CHANGING_DELAY 300

#define DEFAULT_ENABLED YES
#define PREFS_ENABLED_KEY @"mainSwitch"

#define DEFAULT_ENABLED_WHEN_PLAYING YES
#define PREFS_ENABLED_WHEN_PLAYING_KEY @"enableWhenPlaying"

#define DEFAULT_ENABLED_IN_CC YES
#define PREFS_ENABLED_IN_CC_KEY @"enableCC"

#define DEFAULT_BLOCK_HUD NO
#define PREFS_BLOCK_HUD_KEY @"blockHUD"

#define DEFAULT_TRANSPARENT_HUD NO
#define PREFS_TRANSPARENT_HUD_KEY @"transparentHUD"

#define DEFAULT_VIB_ENABLED NO
#define PREFS_VIB_ENABLED_KEY @"enableVib"

#define DEFAULT_VIB_DURATION 30
#define PREFS_VIB_DURATION_KEY @"vibDuration"

#define DEFAULT_FLASH_ENABLED NO
#define PREFS_FLASH_ENABLED_KEY @"enableFlash"

#define DEFAULT_FLASH_BRIGHTNESS 1
#define PREFS_FLASH_BRIGHTNESS_KEY @"flashBrightness"

#define DEFAULT_CHANGE_TRACKS_ENABLED NO
#define PREFS_CHANGE_TRACKS_ENABLED_KEY @"changeTracks"

#define DEFAULT_SOUND_NAME @""
#define PREFS_SOUND_NAME_KEY @"soundName"

#define DEFAULT_SOUND_CHOICE 1
#define PREFS_SOUND_CHOICE_KEY @"built-in"

#define DEFAULT_SOUND_A @"/System/Library/Audio/UISounds/VolumeNotifier/volume.aiff"
#define DEFAULT_SOUND_B @"/System/Library/Audio/UISounds/VolumeNotifier/beep.caf"
#define DEFAULT_SOUND_C @"/System/Library/Audio/UISounds/VolumeNotifier/tink.aiff"
#define DEFAULT_SOUND_D @"/System/Library/Audio/UISounds/VolumeNotifier/morse.aiff"
#define DEFAULT_SOUND_E @"/System/Library/Audio/UISounds/VolumeNotifier/ping.aiff"
#define DEFAULT_SOUND_F @"/System/Library/Audio/UISounds/VolumeNotifier/pop.aiff"
#define DEFAULT_SOUND_G @"/System/Library/Audio/UISounds/VolumeNotifier/mavericks.aiff"

#define MAIN_ENABLED ([preferences objectForKey: PREFS_ENABLED_KEY] ? [[preferences objectForKey: PREFS_ENABLED_KEY] boolValue] : DEFAULT_ENABLED)

#define MAIN_ENABLED_WHEN_PLAYING ([preferences objectForKey: PREFS_ENABLED_WHEN_PLAYING_KEY] ? [[preferences objectForKey: PREFS_ENABLED_WHEN_PLAYING_KEY] boolValue] : DEFAULT_ENABLED_WHEN_PLAYING)

#define MAIN_CC_ENABLED ([preferences objectForKey: PREFS_ENABLED_IN_CC_KEY] ? [[preferences objectForKey: PREFS_ENABLED_IN_CC_KEY] boolValue] : DEFAULT_ENABLED_IN_CC)

#define MAIN_BLOCK_HUD ([preferences objectForKey: PREFS_BLOCK_HUD_KEY] ? [[preferences objectForKey: PREFS_BLOCK_HUD_KEY] boolValue] : DEFAULT_BLOCK_HUD)

#define MAIN_TRANSPARENT_HUD ([preferences objectForKey: PREFS_TRANSPARENT_HUD_KEY] ? [[preferences objectForKey: PREFS_TRANSPARENT_HUD_KEY] boolValue] : DEFAULT_TRANSPARENT_HUD)

#define MAIN_VIB_ENABLED ([preferences objectForKey: PREFS_VIB_ENABLED_KEY] ? [[preferences objectForKey: PREFS_VIB_ENABLED_KEY] boolValue] : DEFAULT_VIB_ENABLED)

#define MAIN_VIB_DURATION ([preferences objectForKey: PREFS_VIB_DURATION_KEY] ? [[preferences objectForKey: PREFS_VIB_DURATION_KEY] floatValue] : DEFAULT_VIB_DURATION)

#define MAIN_FLASH_ENABLED ([preferences objectForKey: PREFS_FLASH_ENABLED_KEY] ? [[preferences objectForKey: PREFS_FLASH_ENABLED_KEY] boolValue] : DEFAULT_FLASH_ENABLED)

#define MAIN_FLASH_BRIGHTNESS ([preferences objectForKey: PREFS_FLASH_BRIGHTNESS_KEY] ? [[preferences objectForKey: PREFS_FLASH_BRIGHTNESS_KEY] floatValue] : DEFAULT_FLASH_BRIGHTNESS)

#define MAIN_CHANGE_TRACKS_ENABLED ([preferences objectForKey: PREFS_CHANGE_TRACKS_ENABLED_KEY] ? [[preferences objectForKey: PREFS_CHANGE_TRACKS_ENABLED_KEY] boolValue] : DEFAULT_CHANGE_TRACKS_ENABLED)

#define MAIN_SOUND_NAME ([preferences objectForKey: PREFS_SOUND_NAME_KEY] ? [preferences objectForKey: PREFS_SOUND_NAME_KEY] : DEFAULT_SOUND_NAME)

#define MAIN_PATH [NSString stringWithFormat:@"/System/Library/Audio/UISounds/VolumeNotifier/%@", MAIN_SOUND_NAME]

#define MAIN_SOUND_CHOICE ([preferences objectForKey: PREFS_SOUND_CHOICE_KEY] ? [[preferences objectForKey: PREFS_SOUND_CHOICE_KEY] intValue] : DEFAULT_SOUND_CHOICE)

#include <logos/logos.h>
#include <substrate.h>
@class MPUMediaControlsVolumeView; @class SBMediaController; @class SBBannerController; @class _UIBackdropContentView; @class SBHUDView; @class VolumeControl; @class SBCCFlashlightSetting; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$_UIBackdropContentView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("_UIBackdropContentView"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBMediaController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBMediaController"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBBannerController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBBannerController"); } return _klass; }
#line 81 "/Users/Zheng/Projects/VolumeNotifier/VolumeNotifier/VolumeNotifier.xm"
#define IS_PLAYING ([[_logos_static_class_lookup$SBMediaController() sharedInstance] isPlaying])

#define SOUND_PREFS_PATH [NSString stringWithFormat:@"%@/Library/Preferences/%@.plist", NSHomeDirectory(), @"com.apple.preferences.sounds"]

#define APPID @"com.darwindev.VolumeNotifier"
#define PREFS_PATH [NSString stringWithFormat:@"%@/Library/Preferences/%@.plist", NSHomeDirectory(), APPID]

#define DEFAULT_PREFS [NSDictionary dictionaryWithObjectsAndKeys: @DEFAULT_ENABLED, PREFS_ENABLED_KEY, @DEFAULT_ENABLED_WHEN_PLAYING, PREFS_ENABLED_WHEN_PLAYING_KEY, @DEFAULT_VIB_ENABLED, PREFS_VIB_ENABLED_KEY, DEFAULT_SOUND_NAME, PREFS_SOUND_NAME_KEY, @DEFAULT_SOUND_CHOICE, PREFS_SOUND_CHOICE_KEY, @DEFAULT_ENABLED_IN_CC, PREFS_ENABLED_IN_CC_KEY, @DEFAULT_BLOCK_HUD, PREFS_BLOCK_HUD_KEY, @DEFAULT_FLASH_ENABLED, PREFS_FLASH_ENABLED_KEY, @DEFAULT_TRANSPARENT_HUD, PREFS_TRANSPARENT_HUD_KEY, @DEFAULT_CHANGE_TRACKS_ENABLED, PREFS_CHANGE_TRACKS_ENABLED_KEY, @DEFAULT_VIB_DURATION, PREFS_VIB_DURATION_KEY, @DEFAULT_FLASH_BRIGHTNESS, PREFS_FLASH_BRIGHTNESS_KEY, nil]

#define IS_IOS_8_PLUS [_logos_static_class_lookup$SBBannerController() instancesRespondToSelector: @selector(_cancelBannerDismissTimers)]

#define IS_LOCKED [(SpringBoard *)[UIApplication sharedApplication] isLocked]

static NSDictionary *preferences = nil;
static NSOperationQueue *queue = [[NSOperationQueue alloc] init];
static NSError *error = nil;
static BOOL torchOpen = NO;
static int lastButtonPressed = 0; 
static float lastVolume = 0;
static NSTimeInterval lastTimePressed;

@interface SpringBoard : UIApplication <UIApplicationDelegate>
- (BOOL)isLocked;
@end

@interface VolumeControl : NSObject
+ (id)sharedVolumeControl;
- (void)decreaseVolume;
- (void)increaseVolume;
- (_Bool)_isMusicPlayingSomewhere;
- (float)getMediaVolume;
@end

@interface SBMediaController : NSObject
+ (id)sharedInstance;
- (_Bool)togglePlayPause;
- (_Bool)changeTrack:(int)arg1;
@end

static void ResetVolume()
{
    [[objc_getClass("SBMediaController") sharedInstance] setVolume:lastVolume];
}

static void ToggleTrack()
{
    ResetVolume();
    [[objc_getClass("SBMediaController") sharedInstance] togglePlayPause];
}

static void ChangeTrack(int trackNumber)
{
    ResetVolume();
    [[objc_getClass("SBMediaController") sharedInstance] changeTrack:trackNumber];
}

static void setTorchLevel(double level) {
    @autoreleasepool {
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch]) {
            if (level > 0.1 && level <= 1.0) {
                [device lockForConfiguration:nil];
                [device setTorchModeOnWithLevel:level error:nil];
                [device unlockForConfiguration];
                if (torchOpen == NO) {
                    torchOpen = YES;
                }
            } else if (level <= 0.1){
                [device lockForConfiguration:nil];
                [device setTorchMode:AVCaptureTorchModeOff];
                [device unlockForConfiguration];
                if (torchOpen == YES) {
                    torchOpen = NO;
                }
            }
        }
    }
}

@implementation SNDPlay

FOUNDATION_EXTERN void AudioServicesPlaySystemSoundWithVibration(unsigned long, objc_object*, NSDictionary*);

- (void) playVibrate {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSArray *pattern = @[@YES, [NSNumber numberWithFloat:MAIN_VIB_DURATION], @NO, @2];
    dictionary[@"VibePattern"] = pattern;
    dictionary[@"Intensity"] = @2;
    AudioServicesPlaySystemSoundWithVibration(kSystemSoundID_Vibrate, nil, dictionary);
}

- (void) playMedia:(id)data {
    @autoreleasepool {
        SndDelegate *sndMain = [SndDelegate alloc];
        AVAudioPlayer *player = (AVAudioPlayer *)data;
        [player prepareToPlay];
        [player setDelegate:sndMain];
        [player play];
    }
}

- (void) playSound:(int)method {
    @autoreleasepool {
        NSURL* sample;
        NSFileManager *fileM = [NSFileManager defaultManager];
        NSString *soundPath = MAIN_PATH;
        if ((([[soundPath pathExtension] isEqual: @"caf"]) || (([[soundPath pathExtension] isEqual: @"aiff"]))) && ([fileM isReadableFileAtPath:soundPath])) {
            sample = [[NSURL alloc] initWithString:MAIN_PATH];
        } else {
            int choice = MAIN_SOUND_CHOICE;
            switch (choice) {
                case 1:
                    sample = [[NSURL alloc] initWithString:DEFAULT_SOUND_A];
                    break;
                case 2:
                    sample = [[NSURL alloc] initWithString:DEFAULT_SOUND_B];
                    break;
                case 3:
                    sample = [[NSURL alloc] initWithString:DEFAULT_SOUND_C];
                    break;
                case 4:
                    sample = [[NSURL alloc] initWithString:DEFAULT_SOUND_D];
                    break;
                case 5:
                    sample = [[NSURL alloc] initWithString:DEFAULT_SOUND_E];
                    break;
                case 6:
                    sample = [[NSURL alloc] initWithString:DEFAULT_SOUND_F];
                    break;
                case 7:
                    sample = [[NSURL alloc] initWithString:DEFAULT_SOUND_G];
                    break;
                default:
                    sample = [[NSURL alloc] initWithString:DEFAULT_SOUND_A];
                    break;
            }
        }
        if (method == 1) {
            SystemSoundID soundID;
            AudioServicesCreateSystemSoundID((CFURLRef)sample, &soundID);
            AudioServicesPlaySystemSound(soundID);
        } else {
            AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:sample error:&error];
            NSInvocationOperation *op = [[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(playMedia:) object:player] autorelease];
            [queue addOperation:op];
        }
    }
}

@end

static void (*_logos_orig$VolumeNotifier$VolumeControl$increaseVolume)(VolumeControl*, SEL); static void _logos_method$VolumeNotifier$VolumeControl$increaseVolume(VolumeControl*, SEL); static void (*_logos_orig$VolumeNotifier$VolumeControl$decreaseVolume)(VolumeControl*, SEL); static void _logos_method$VolumeNotifier$VolumeControl$decreaseVolume(VolumeControl*, SEL); static void (*_logos_orig$VolumeNotifier$VolumeControl$_presentVolumeHUDWithMode$volume$)(VolumeControl*, SEL, int, float); static void _logos_method$VolumeNotifier$VolumeControl$_presentVolumeHUDWithMode$volume$(VolumeControl*, SEL, int, float); static void (*_logos_orig$VolumeNotifier$SBHUDView$layoutSubviews)(SBHUDView*, SEL); static void _logos_method$VolumeNotifier$SBHUDView$layoutSubviews(SBHUDView*, SEL); static void (*_logos_orig$VolumeNotifier$MPUMediaControlsVolumeView$_volumeSliderStoppedChanging$)(MPUMediaControlsVolumeView*, SEL, id); static void _logos_method$VolumeNotifier$MPUMediaControlsVolumeView$_volumeSliderStoppedChanging$(MPUMediaControlsVolumeView*, SEL, id); static bool (*_logos_orig$VolumeNotifier$SBCCFlashlightSetting$isFlashlightOn)(SBCCFlashlightSetting*, SEL); static bool _logos_method$VolumeNotifier$SBCCFlashlightSetting$isFlashlightOn(SBCCFlashlightSetting*, SEL); static bool (*_logos_orig$VolumeNotifier$SBCCFlashlightSetting$_enableTorch$)(SBCCFlashlightSetting*, SEL, bool); static bool _logos_method$VolumeNotifier$SBCCFlashlightSetting$_enableTorch$(SBCCFlashlightSetting*, SEL, bool); static void (*_logos_orig$VolumeNotifier$SBCCFlashlightSetting$_updateState)(SBCCFlashlightSetting*, SEL); static void _logos_method$VolumeNotifier$SBCCFlashlightSetting$_updateState(SBCCFlashlightSetting*, SEL); 








static void _logos_method$VolumeNotifier$VolumeControl$increaseVolume(VolumeControl* self, SEL _cmd) {
    if (MAIN_CHANGE_TRACKS_ENABLED == YES) {
        if (lastButtonPressed == 1) {
            if (lastTimePressed + DEFAULT_CHANGING_DELAY >= [[NSDate date] timeIntervalSince1970] * 1000 && (![self respondsToSelector:@selector(_isMusicPlayingSomewhere)] || [self _isMusicPlayingSomewhere])) {
                lastTimePressed = [[NSDate date] timeIntervalSince1970] * 1000;
                ChangeTrack(1);
                return;
            }
        } else if (lastButtonPressed == -1) {
            if (lastTimePressed + DEFAULT_CHANGING_DELAY >= [[NSDate date] timeIntervalSince1970] * 1000) {
                lastTimePressed = [[NSDate date] timeIntervalSince1970] * 1000;
                ToggleTrack();
                return;
            }
        }
        lastButtonPressed = 1;
        lastTimePressed = [[NSDate date] timeIntervalSince1970] * 1000;
        lastVolume = [self getMediaVolume];
    }
    _logos_orig$VolumeNotifier$VolumeControl$increaseVolume(self, _cmd);
}

static void _logos_method$VolumeNotifier$VolumeControl$decreaseVolume(VolumeControl* self, SEL _cmd) {
    if (MAIN_CHANGE_TRACKS_ENABLED == YES) {
        if (lastButtonPressed == -1) {
            if (lastTimePressed + DEFAULT_CHANGING_DELAY >= [[NSDate date] timeIntervalSince1970] * 1000 && (![self respondsToSelector:@selector(_isMusicPlayingSomewhere)] || [self _isMusicPlayingSomewhere])) {
                lastTimePressed = [[NSDate date] timeIntervalSince1970] * 1000;
                ChangeTrack(-1);
                return;
            }
        } else if (lastButtonPressed == 1) {
            if (lastTimePressed + DEFAULT_CHANGING_DELAY >= [[NSDate date] timeIntervalSince1970] * 1000) {
                lastTimePressed = [[NSDate date] timeIntervalSince1970] * 1000;
                ToggleTrack();
                return;
            }
        }
        lastButtonPressed = -1;
        lastTimePressed = [[NSDate date] timeIntervalSince1970] * 1000;
        lastVolume = [self getMediaVolume];
    }
    _logos_orig$VolumeNotifier$VolumeControl$decreaseVolume(self, _cmd);
}



static void _logos_method$VolumeNotifier$VolumeControl$_presentVolumeHUDWithMode$volume$(VolumeControl* self, SEL _cmd, int mode, float vol) {
    if (MAIN_BLOCK_HUD == NO)
        _logos_orig$VolumeNotifier$VolumeControl$_presentVolumeHUDWithMode$volume$(self, _cmd, mode, vol);
    if (MAIN_ENABLED) {
        if (mode == 1 || (MAIN_ENABLED_WHEN_PLAYING == YES && IS_PLAYING == YES)) {
            SNDPlay *sndObj = [[SNDPlay alloc] autorelease];
            [sndObj playSound:1];
        } else if ((mode == 0 || mode == 2) && (MAIN_ENABLED_WHEN_PLAYING == YES || IS_PLAYING == NO)) {
            SNDPlay *sndObj = [[SNDPlay alloc] autorelease];
            [sndObj playSound:2];
        }
    }
    if (MAIN_VIB_ENABLED == YES) {
        NSInvocationOperation *op = [[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(playVibrate) object:nil] autorelease];
        [queue addOperation:op];
    }
    if (MAIN_FLASH_ENABLED == YES)
        setTorchLevel(MAIN_FLASH_BRIGHTNESS);
    else if (torchOpen == YES)
        setTorchLevel(0);
}





static void _logos_method$VolumeNotifier$SBHUDView$layoutSubviews(SBHUDView* self, SEL _cmd) {
    if (MAIN_TRANSPARENT_HUD == YES) {
        id backdropView = MSHookIvar<id>(self, "_backdropView");
        if ([backdropView respondsToSelector:@selector(subviews)]) {
            NSArray *subViews = [backdropView subviews];
            for (UIView *subView in subViews) {
                if (![subView isMemberOfClass:[_logos_static_class_lookup$_UIBackdropContentView() class]]) {
                    [subView setHidden:YES];
                }
            }
        }
    }
    _logos_orig$VolumeNotifier$SBHUDView$layoutSubviews(self, _cmd);
}





static void _logos_method$VolumeNotifier$MPUMediaControlsVolumeView$_volumeSliderStoppedChanging$(MPUMediaControlsVolumeView* self, SEL _cmd, id pid) {
    _logos_orig$VolumeNotifier$MPUMediaControlsVolumeView$_volumeSliderStoppedChanging$(self, _cmd, pid);
    if (MAIN_ENABLED == YES && MAIN_CC_ENABLED == YES) {
        if (IS_PLAYING == NO) {
            SNDPlay *sndObj = [SNDPlay alloc];
            [sndObj playSound:2];
        } else {
            if (MAIN_ENABLED_WHEN_PLAYING == YES) {
                SNDPlay *sndObj = [SNDPlay alloc];
                [sndObj playSound:1];
            }
        }
    }
}





static bool _logos_method$VolumeNotifier$SBCCFlashlightSetting$isFlashlightOn(SBCCFlashlightSetting* self, SEL _cmd) {
    if (MAIN_FLASH_ENABLED == YES) {
        if (_logos_orig$VolumeNotifier$SBCCFlashlightSetting$isFlashlightOn(self, _cmd) || (torchOpen == YES)) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return _logos_orig$VolumeNotifier$SBCCFlashlightSetting$isFlashlightOn(self, _cmd);
    }
}

static bool _logos_method$VolumeNotifier$SBCCFlashlightSetting$_enableTorch$(SBCCFlashlightSetting* self, SEL _cmd, bool arg1) {
    if (MAIN_FLASH_ENABLED == YES) {
        if (torchOpen == YES) {
            setTorchLevel(0);
            return NO;
        }
    }
    return _logos_orig$VolumeNotifier$SBCCFlashlightSetting$_enableTorch$(self, _cmd, arg1);
}

static void _logos_method$VolumeNotifier$SBCCFlashlightSetting$_updateState(SBCCFlashlightSetting* self, SEL _cmd) {
    if (MAIN_FLASH_ENABLED == YES) {
        if (torchOpen == YES) {
            return;
        }
    }
    _logos_orig$VolumeNotifier$SBCCFlashlightSetting$_updateState(self, _cmd);
}





static void loadSettings () {
    if (preferences) {
        [preferences release];
        preferences = nil;
    }
    if (IS_IOS_8_PLUS) {
        NSArray *keyList = [(NSArray *)CFPreferencesCopyKeyList((CFStringRef)APPID, kCFPreferencesCurrentUser, kCFPreferencesAnyHost) autorelease];
        preferences = (NSDictionary *)CFPreferencesCopyMultiple((CFArrayRef)keyList, (CFStringRef)APPID, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    } else {
        preferences = [[NSDictionary dictionaryWithContentsOfFile: PREFS_PATH] retain];
    }
    if (!preferences || preferences.count == 0) {
        preferences = [DEFAULT_PREFS retain];
    }
    if (MAIN_ENABLED == YES) {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback withOptions:AVAudioSessionCategoryOptionMixWithOthers error:&error];
        [[AVAudioSession sharedInstance] setActive:YES error:&error];
    }
    if (torchOpen == YES) {
        if (MAIN_FLASH_ENABLED == YES)
            setTorchLevel(MAIN_FLASH_BRIGHTNESS);
        else
            setTorchLevel(0);
    }
}

static void didChangeSettings (CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    loadSettings();
}

static __attribute__((constructor)) void _logosLocalCtor_db383536() {
    CFNotificationCenterRef center = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(center, NULL, &didChangeSettings, (CFStringRef)@"com.darwindev.VolumeNotifier-preferencesChanged", NULL, 0);
    loadSettings();
    {Class _logos_class$VolumeNotifier$VolumeControl = objc_getClass("VolumeControl"); MSHookMessageEx(_logos_class$VolumeNotifier$VolumeControl, @selector(increaseVolume), (IMP)&_logos_method$VolumeNotifier$VolumeControl$increaseVolume, (IMP*)&_logos_orig$VolumeNotifier$VolumeControl$increaseVolume);MSHookMessageEx(_logos_class$VolumeNotifier$VolumeControl, @selector(decreaseVolume), (IMP)&_logos_method$VolumeNotifier$VolumeControl$decreaseVolume, (IMP*)&_logos_orig$VolumeNotifier$VolumeControl$decreaseVolume);MSHookMessageEx(_logos_class$VolumeNotifier$VolumeControl, @selector(_presentVolumeHUDWithMode:volume:), (IMP)&_logos_method$VolumeNotifier$VolumeControl$_presentVolumeHUDWithMode$volume$, (IMP*)&_logos_orig$VolumeNotifier$VolumeControl$_presentVolumeHUDWithMode$volume$);Class _logos_class$VolumeNotifier$SBHUDView = objc_getClass("SBHUDView"); MSHookMessageEx(_logos_class$VolumeNotifier$SBHUDView, @selector(layoutSubviews), (IMP)&_logos_method$VolumeNotifier$SBHUDView$layoutSubviews, (IMP*)&_logos_orig$VolumeNotifier$SBHUDView$layoutSubviews);Class _logos_class$VolumeNotifier$MPUMediaControlsVolumeView = objc_getClass("MPUMediaControlsVolumeView"); MSHookMessageEx(_logos_class$VolumeNotifier$MPUMediaControlsVolumeView, @selector(_volumeSliderStoppedChanging:), (IMP)&_logos_method$VolumeNotifier$MPUMediaControlsVolumeView$_volumeSliderStoppedChanging$, (IMP*)&_logos_orig$VolumeNotifier$MPUMediaControlsVolumeView$_volumeSliderStoppedChanging$);Class _logos_class$VolumeNotifier$SBCCFlashlightSetting = objc_getClass("SBCCFlashlightSetting"); MSHookMessageEx(_logos_class$VolumeNotifier$SBCCFlashlightSetting, @selector(isFlashlightOn), (IMP)&_logos_method$VolumeNotifier$SBCCFlashlightSetting$isFlashlightOn, (IMP*)&_logos_orig$VolumeNotifier$SBCCFlashlightSetting$isFlashlightOn);MSHookMessageEx(_logos_class$VolumeNotifier$SBCCFlashlightSetting, @selector(_enableTorch:), (IMP)&_logos_method$VolumeNotifier$SBCCFlashlightSetting$_enableTorch$, (IMP*)&_logos_orig$VolumeNotifier$SBCCFlashlightSetting$_enableTorch$);MSHookMessageEx(_logos_class$VolumeNotifier$SBCCFlashlightSetting, @selector(_updateState), (IMP)&_logos_method$VolumeNotifier$SBCCFlashlightSetting$_updateState, (IMP*)&_logos_orig$VolumeNotifier$SBCCFlashlightSetting$_updateState);}
}
