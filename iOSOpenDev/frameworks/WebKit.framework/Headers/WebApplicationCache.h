/**
 * This header is generated by class-dump-z 0.2b.
 *
 * Source: /System/Library/PrivateFrameworks/WebKit.framework/WebKit
 */

#import <WebKit/XXUnknownSuperclass.h>


@interface WebApplicationCache : XXUnknownSuperclass {
}
+ (void)initializeWithBundleIdentifier:(id)bundleIdentifier;	// 0x3406d
+ (long long)maximumSize;	// 0x341bd
+ (void)setMaximumSize:(long long)size;	// 0x341cd
+ (long long)defaultOriginQuota;	// 0x3405d
+ (void)setDefaultOriginQuota:(long long)quota;	// 0xd689
+ (long long)diskUsageForOrigin:(id)origin;	// 0x34521
+ (void)deleteAllApplicationCaches;	// 0x34511
+ (void)deleteCacheForOrigin:(id)origin;	// 0x344f1
+ (id)originsWithCache;	// 0x34201
@end