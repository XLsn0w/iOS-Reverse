/**
 * This header is generated by class-dump-z 0.2b.
 *
 * Source: /System/Library/PrivateFrameworks/DataDetectorsUI.framework/DataDetectorsUI
 */

#import <DataDetectorsUI/XXUnknownSuperclass.h>

@class DOMNode;

__attribute__((visibility("hidden")))
@interface DDRange : XXUnknownSuperclass {
@private
	DOMNode *_node;	// 4 = 0x4
	long _startOffset;	// 8 = 0x8
	long _endOffset;	// 12 = 0xc
}
@property(assign, nonatomic) long endOffset;	// G=0x9ddd; S=0x9ded; @synthesize=_endOffset
@property(assign, nonatomic) long startOffset;	// G=0x9dbd; S=0x9dcd; @synthesize=_startOffset
@property(retain, nonatomic) DOMNode *node;	// G=0x9d89; S=0x9d99; @synthesize=_node
+ (id)rangeWithDOMRange:(id)domrange;	// 0x9c99
// declared property setter: - (void)setEndOffset:(long)offset;	// 0x9ded
// declared property getter: - (long)endOffset;	// 0x9ddd
// declared property setter: - (void)setStartOffset:(long)offset;	// 0x9dcd
// declared property getter: - (long)startOffset;	// 0x9dbd
// declared property setter: - (void)setNode:(id)node;	// 0x9d99
// declared property getter: - (id)node;	// 0x9d89
- (id)description;	// 0x9d21
- (void)dealloc;	// 0x9cd5
- (id)initWithDOMRange:(id)domrange;	// 0x9bf5
@end
