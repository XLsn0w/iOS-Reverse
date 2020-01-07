//
//  VolumeNotifierPrefsController.h
//  VolumeNotifierPrefs
//
//  Created by Zheng on 11/8/14.
//  Copyright (c) 2015 82Flex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Preferences/Preferences.h>
#import "SettingsKit/SKListControllerProtocol.h"
#import "SettingsKit/SKTintedListController.h"

@interface VolumeNotifierPrefsController : SKTintedListController <SKListControllerProtocol>

- (BOOL) showHeartImage;
- (UIColor*) tintColor;
- (NSString*) headerText;
- (NSString*) headerSubText;
- (NSString*) customTitle;
- (NSArray *) customSpecifiers;
- (void) followOnTwitter:(PSSpecifier*)specifier;
- (void) visitWebSite:(PSSpecifier*)specifier;
- (void) makeDonation:(PSSpecifier*)specifier;

@end
