/**
 * This header is generated by class-dump-z 0.2b.
 *
 * Source: /System/Library/PrivateFrameworks/Search.framework/Search
 */

#import <Search/Search-Structs.h>


@class NSMutableArray, NSString;

@interface SPContentIndexer : NSObject {
	NSString *_displayIdentifier;	// 4 = 0x4
	NSString *_category;	// 8 = 0x8
	CXQueryRef _query;	// 12 = 0xc
	CXIndexRef _index;	// 16 = 0x10
	unsigned _version;	// 20 = 0x14
	CPRecordStoreRef _store;	// 24 = 0x18
	NSMutableArray *_dirtyRecords;	// 28 = 0x1c
	NSMutableArray *_dirtyContent;	// 32 = 0x20
	NSMutableArray *_dirtyRemoves;	// 36 = 0x24
}
+ (void)initialize;	// 0x7d15
+ (void)preheat;	// 0x7c2d
+ (id)indexerForDisplayIdentifier:(id)displayIdentifier category:(id)category;	// 0x7ad9
- (void)dealloc;	// 0x79f9
- (id)initWithDisplayIdentifier:(id)displayIdentifier category:(id)category version:(unsigned)version;	// 0x7879
- (void *)copyResultForIdentifier:(id)identifier;	// 0x77a9
- (void)cancelSearch;	// 0x7779
- (BOOL)nextSearchResults:(id *)results;	// 0x76d9
- (void)beginSearch:(id)search;	// 0x75d5
- (void)removeIdentifier:(id)identifier;	// 0x7531
- (void)setIdentifier:(id)identifier forRecordDictionary:(id)recordDictionary;	// 0x7391
- (void *)_copyRecordForExternalID:(id)externalID;	// 0x7229
- (BOOL)commitUpdates;	// 0x6de9
- (void)clearIndex;	// 0x6d6d
- (void)_openOrCreateIndex;	// 0x6ad5
- (BOOL)_openOrCreateStore;	// 0x69dd
- (id)_storePath;	// 0x6999
- (id)_indexPath;	// 0x6955
@end
