/**
 * This header is generated by class-dump-z 0.2b.
 *
 * Source: /System/Library/PrivateFrameworks/IMCore.framework/Frameworks/IMFoundation.framework/IMFoundation
 */

#import <IMFoundation/IMFoundation-Structs.h>
#import <IMFoundation/XXUnknownSuperclass.h>

@class NSMutableDictionary;

@interface IMUserNotificationCenter : XXUnknownSuperclass {
	NSMutableDictionary *_identifierToIMUserNotificationQueueMap;	// 4 = 0x4
	NSMutableDictionary *_identifierToListenerQueueMap;	// 8 = 0x8
	NSMutableDictionary *_identifierToBlockQueueMap;	// 12 = 0xc
	NSMutableDictionary *_identifierToRunLoopSourcesMap;	// 16 = 0x10
	NSMutableDictionary *_identifierToCFUserNotificationMap;	// 20 = 0x14
}
@property(retain, nonatomic) NSMutableDictionary *identifierToCFUserNotificationMap;	// G=0x18201; S=0x18211; @synthesize=_identifierToCFUserNotificationMap
@property(retain, nonatomic) NSMutableDictionary *identifierToRunLoopSourcesMap;	// G=0x181cd; S=0x181dd; @synthesize=_identifierToRunLoopSourcesMap
@property(retain, nonatomic) NSMutableDictionary *identifierToBlockQueueMap;	// G=0x18199; S=0x181a9; @synthesize=_identifierToBlockQueueMap
@property(retain, nonatomic) NSMutableDictionary *identifierToListenerQueueMap;	// G=0x18165; S=0x18175; @synthesize=_identifierToListenerQueueMap
@property(retain, nonatomic) NSMutableDictionary *identifierToIMUserNotificationQueueMap;	// G=0x18131; S=0x18141; @synthesize=_identifierToIMUserNotificationQueueMap
+ (id)sharedInstance;	// 0x16f09
// declared property setter: - (void)setIdentifierToCFUserNotificationMap:(id)cfuserNotificationMap;	// 0x18211
// declared property getter: - (id)identifierToCFUserNotificationMap;	// 0x18201
// declared property setter: - (void)setIdentifierToRunLoopSourcesMap:(id)runLoopSourcesMap;	// 0x181dd
// declared property getter: - (id)identifierToRunLoopSourcesMap;	// 0x181cd
// declared property setter: - (void)setIdentifierToBlockQueueMap:(id)blockQueueMap;	// 0x181a9
// declared property getter: - (id)identifierToBlockQueueMap;	// 0x18199
// declared property setter: - (void)setIdentifierToListenerQueueMap:(id)listenerQueueMap;	// 0x18175
// declared property getter: - (id)identifierToListenerQueueMap;	// 0x18165
// declared property setter: - (void)setIdentifierToIMUserNotificationQueueMap:(id)imuserNotificationQueueMap;	// 0x18141
// declared property getter: - (id)identifierToIMUserNotificationQueueMap;	// 0x18131
- (void)removeAllListeners;	// 0x17fa5
- (void)removeListener:(id)listener;	// 0x17c65
- (unsigned)countForIdentifier:(id)identifier;	// 0x17c2d
- (void)addUserNotification:(id)notification listener:(id)listener completionHandler:(id)handler;	// 0x17b8d
- (void)addUserNotification:(id)notification listener:(id)listener;	// 0x17b69
- (void)_handleUserNotification:(CFUserNotificationRef)notification responseFlags:(unsigned long)flags;	// 0x17995
- (void)_displayNextUserNotificationForIdentifier:(id)identifier;	// 0x177d5
- (void)_cancelActiveUserNotificationForIdentifier:(id)identifier;	// 0x176b5
- (void)_enqueueBlock:(id)block forIdentifier:(id)identifier;	// 0x1757d
- (void)_enqueueListener:(id)listener forIdentifier:(id)identifier;	// 0x1748d
- (void)_enqueueUserNotification:(id)notification forIdentifier:(id)identifier;	// 0x173ad
- (id)_dequeueBlockForIdentifier:(id)identifier;	// 0x172a1
- (id)_dequeueListenerForIdentifier:(id)identifier;	// 0x171e1
- (id)_dequeueUserNotificationForIdentifier:(id)identifier;	// 0x17101
- (id)_frontBlockForIdentifier:(id)identifier;	// 0x170c9
- (id)_frontListenerForIdentifier:(id)identifier;	// 0x17091
- (id)_frontUserNotificationForIdentifier:(id)identifier;	// 0x17059
- (void)dealloc;	// 0x16fbd
- (BOOL)retainWeakReference;	// 0x16fb9
- (BOOL)allowsWeakReference;	// 0x16fb5
@end