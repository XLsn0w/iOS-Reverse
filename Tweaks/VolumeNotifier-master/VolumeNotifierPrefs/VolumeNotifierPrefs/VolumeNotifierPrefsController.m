//
//  VolumeNotifierPrefsController.m
//  VolumeNotifierPrefs
//
//  Created by Zheng on 11/8/14.
//  Copyright (c) 2015 82Flex. All rights reserved.
//

#import <VolumeNotifierPrefsController.h>
#import <Preferences/Preferences.h>
#import "SettingsKit/SKListControllerProtocol.h"
#import "SettingsKit/SKTintedListController.h"
#import "SettingsKit/SKSharedHelper.h"
#import <Preferences/PSSpecifier.h>

#define kUrl_VisitWebSite @"http://82flex.com"
#define kUrl_MakeDonation @"https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=g1ghell@163.com&item_name=zsm1703"
#define kUrl_MailTo @"i.82@me.com"
#define kUrl_MailSubject @"VolumeNotifier"
#define kUrl_Twitter @"82flexofficial"

@implementation VolumeNotifierPrefsController

- (UIColor*) tintColor {
    return [UIColor darkGrayColor];
}

-(UIColor*) switchTintColor {
    return [UIColor grayColor];
}

- (BOOL) showHeartImage { return NO; }

- (NSString*) headerText { return @"VolumeNotifier"; }

- (NSString*) headerSubText { return @"By i_82"; }

- (NSString*) customTitle { return @"VolumeNotifier"; }

- (NSArray *) customSpecifiers {
    return @[
                @{
                    @"cell" : @"PSGroupCell",
                    @"label" : @"Switch",
                    @"isStaticText" : @YES
                    },
                @{
                    @"cell" : @"PSSwitchCell",
                    @"label" : @"Enabled",
                    @"default" : @YES,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"mainSwitch"
                    },
                @{
                    @"cell" : @"PSSwitchCell",
                    @"label" : @"Enabled When Playing",
                    @"default" : @YES,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"enableWhenPlaying"
                    },
                @{
                    @"cell" : @"PSSwitchCell",
                    @"label" : @"Enabled in CC",
                    @"default" : @YES,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"enableCC"
                    },
                @{
                    @"cell" : @"PSGroupCell",
                    @"label" : @"Addition",
                    @"isStaticText" : @YES
                    },
                @{
                    @"cell" : @"PSSwitchCell",
                    @"label" : @"Enable Vibrate",
                    @"default" : @NO,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"enableVib"
                    },
                @{
                    @"cell" : @"PSSliderCell",
                    @"label" : @"Vibrate Duration",
                    @"min" : @1,
                    @"max" : @1000,
                    @"default" : @30,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"vibDuration"
                    },
                @{
                    @"cell" : @"PSSwitchCell",
                    @"label" : @"Enable Flashlight",
                    @"default" : @NO,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"enableFlash"
                    },
                @{
                    @"cell" : @"PSSliderCell",
                    @"label" : @"Flashlight Brightness",
                    @"min" : @0.001,
                    @"max" : @1,
                    @"default" : @1,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"flashBrightness"
                    },
                @{
                    @"cell" : @"PSSwitchCell",
                    @"label" : @"Block Volume HUD",
                    @"default" : @NO,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"blockHUD"
                    },
                @{
                    @"cell" : @"PSSwitchCell",
                    @"label" : @"Transparent HUD",
                    @"default" : @NO,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"transparentHUD"
                    },
                @{
                    @"cell" : @"PSGroupCell",
                    @"footerText" : @"You can turn off the flashlight from CC.\nVolumeNotifier will not work perfectly when the device is locked."
                    },
                @{
                    @"cell" : @"PSGroupCell",
                    @"label" : @"Experiment",
                    @"isStaticText" : @YES
                    },
                @{
                    @"cell" : @"PSSwitchCell",
                    @"label" : @"Long Press To Change Tracks",
                    @"default" : @NO,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"changeTracks"
                    },
                @{
                    @"cell" : @"PSGroupCell",
                    @"footerText" : @"Long press \"+\" or \"-\" to change between tracks.\nPress \"+\" and then press \"-\" to play/pause."
                    },
                @{
                    @"cell" : @"PSGroupCell",
                    @"label" : @"Sound Effect",
                    @"isStaticText" : @YES
                    },
                @{
                    @"cell" : @"PSLinkListCell",
                    @"label" : @"Built-in",
                    @"default" : @1,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"built-in",
                    @"detail" : @"PSListItemsController",
                    @"validTitles" : @[
                            @"Yosemite",
                            @"Beep",
                            @"Tink",
                            @"Morse",
                            @"Ping",
                            @"Pop",
                            @"Mavericks"
                        ],
                    @"validValues" :@[
                            @1,
                            @2,
                            @3,
                            @4,
                            @5,
                            @6,
                            @7
                        ]
                    },
                @{
                    @"cell" : @"PSEditTextCell",
                    @"label" : @"Custom",
                    @"default" : @"",
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"soundName",
                    @"placeholder" : @"sound.caf"
                    },
                @{
                    @"cell" : @"PSGroupCell",
                    @"footerText" : @"Leave the Custom Sound Name empty to use Built-in sound.\nCustom Sounds should be placed at /System/Library/Audio/UISounds/VolumeNotifier."
                    },
                @{
                    @"cell" : @"PSGroupCell",
                    @"label" : @"Support",
                    @"isStaticText" : @YES
                    },
                @{
                    @"cell" : @"PSButtonCell",
                    @"label" : @"Follow @82FlexOfficial",
                    @"icon" : @"twitter.png",
                    @"action" : @"followOnTwitter:"
                    },
                @{
                    @"cell" : @"PSButtonCell",
                    @"label" : @"Visit 82Flex.com",
                    @"icon" : @"enabled.png",
                    @"action" : @"visitWebSite:"
                    },
                @{
                    @"cell" : @"PSButtonCell",
                    @"label" : @"Give suggestions",
                    @"icon" : @"support.png",
                    @"action" : @"giveAdvice:"
                    },
                @{
                    @"cell" : @"PSButtonCell",
                    @"label" : @"Donate to 82Flex",
                    @"icon" : @"paypal.png",
                    @"action" : @"makeDonation:"
                    },
                @{
                    @"cell" : @"PSGroupCell",
                    @"footerText" : @"VolumeNotifier © 2015 82Flex.com"
                    }
            ];
}

- (void) followOnTwitter:(PSSpecifier *)specifier {
    [SKSharedHelper openTwitter:kUrl_Twitter];
}

- (void) visitWebSite:(PSSpecifier *)specifier {
    [SKSharedHelper openWebSite:kUrl_VisitWebSite];
}

- (void) giveAdvice:(PSSpecifier *)specifier {
    [SKSharedHelper openEmail:kUrl_MailTo subject:kUrl_MailSubject];
}

- (void) makeDonation:(PSSpecifier *)specifier {
    [SKSharedHelper openWebSite:kUrl_MakeDonation];
}

@end