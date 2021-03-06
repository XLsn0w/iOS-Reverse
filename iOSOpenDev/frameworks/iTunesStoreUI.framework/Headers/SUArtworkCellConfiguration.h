/**
 * This header is generated by class-dump-z 0.2b.
 *
 * Source: /System/Library/PrivateFrameworks/iTunesStoreUI.framework/iTunesStoreUI
 */

#import <iTunesStoreUI/ISStoreURLOperationDelegate.h>
#import <iTunesStoreUI/iTunesStoreUI-Structs.h>
#import <iTunesStoreUI/SUArrayCellConfiguration.h>

@class NSMutableDictionary, NSMutableArray;

@interface SUArtworkCellConfiguration : SUArrayCellConfiguration <ISStoreURLOperationDelegate> {
	NSMutableDictionary *_artworkByURL;	// 60 = 0x3c
	NSMutableArray *_artworkLoadOperations;	// 64 = 0x40
}
+ (id)copyDefaultContext;	// 0x1ed51
- (id)_artworkImageForURL:(id)url dataProvider:(id)provider;	// 0x1ef4d
- (void)operation:(id)operation finishedWithOutput:(id)output;	// 0x1ee1d
- (void)operation:(id)operation failedWithError:(id)error;	// 0x1eddd
- (void)setRepresentedObject:(id)object;	// 0x1ed85
- (void)reloadAfterArtworkLoad;	// 0x1ed11
- (id)copyImageDataProvider;	// 0x1ecd9
- (void)cancelArtworkRequests;	// 0x1ebc5
- (id)artworkImageForURL:(id)url;	// 0x1eb55
- (id)artworkImageForItemImage:(id)itemImage;	// 0x1ea9d
- (void)dealloc;	// 0x1ea11
@end
