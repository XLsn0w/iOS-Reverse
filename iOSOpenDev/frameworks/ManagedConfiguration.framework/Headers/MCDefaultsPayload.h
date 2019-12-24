/**
 * This header is generated by class-dump-z 0.2b.
 *
 * Source: /System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration
 */

#import <ManagedConfiguration/MCPayload.h>

@class NSDictionary;

@interface MCDefaultsPayload : MCPayload {
	NSDictionary *_defaultsByDomain;	// 40 = 0x28
}
+ (id)typeStrings;	// 0x167d5
+ (id)localizedDescriptionForPayloadCount:(unsigned)payloadCount;	// 0x16bf5
+ (id)_allowedDefaults;	// 0x167fd
- (BOOL)_checkForValidDefaults:(id)validDefaults outError:(id *)error;	// 0x168b5
- (id)initWithDictionary:(id)dictionary profile:(id)profile outError:(id *)error;	// 0x16f4d
- (void)dealloc;	// 0x16ba9
- (id)stubDictionary;	// 0x16db5
- (id)description;	// 0x16d35
- (id)domains;	// 0x16785
- (id)defaultsForDomain:(id)domain;	// 0x167a5
- (id)subtitle1Description;	// 0x16c55
@end