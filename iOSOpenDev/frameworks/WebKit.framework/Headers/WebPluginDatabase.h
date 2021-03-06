/**
 * This header is generated by class-dump-z 0.2b.
 *
 * Source: /System/Library/PrivateFrameworks/WebKit.framework/WebKit
 */

#import <WebKit/XXUnknownSuperclass.h>
#import <WebKit/WebPluginDatabase.h>

@class NSArray, NSMutableDictionary, NSMutableSet;

@interface WebPluginDatabase : XXUnknownSuperclass {
@private
	NSMutableDictionary *plugins;	// 4 = 0x4
	NSMutableSet *registeredMIMETypes;	// 8 = 0x8
	NSArray *plugInPaths;	// 12 = 0xc
	NSMutableSet *pluginInstanceViews;	// 16 = 0x10
}
@property(readonly, retain) NSMutableDictionary *plugins;	// G=0x21dbd; converted property
+ (id)sharedDatabase;	// 0x1eb25
+ (void)closeSharedDatabase;	// 0x6dc01
+ (void)setAdditionalWebPlugInPaths:(id)paths;	// 0x6dbc1
- (id)pluginForMIMEType:(id)mimetype;	// 0x20ce1
- (id)pluginForExtension:(id)extension;	// 0x6dca5
// converted property getter: - (id)plugins;	// 0x21dbd
- (void)setPlugInPaths:(id)paths;	// 0x1ecc9
- (void)close;	// 0x6d8ed
- (id)init;	// 0x1ebb5
- (void)dealloc;	// 0x6dc1d
- (void)refresh;	// 0x1ed11
- (BOOL)isMIMETypeRegistered:(id)registered;	// 0x6d979
- (void)addPluginInstanceView:(id)view;	// 0x6d9a1
- (void)removePluginInstanceView:(id)view;	// 0x6d9c5
- (void)removePluginInstanceViewsFor:(id)aFor;	// 0x6d9e9
- (void)destroyAllPluginInstanceViews;	// 0x6dafd
@end

@interface WebPluginDatabase (Internal)
+ (id)_defaultPlugInPaths;	// 0x1ec49
- (id)_plugInPaths;	// 0x1f2ed
- (void)_addPlugin:(id)plugin;	// 0x20b8d
- (void)_removePlugin:(id)plugin;	// 0x6deed
- (id)_scanForNewPlugins;	// 0x1f125
@end
