/**
 * This header is generated by class-dump-z 0.2b.
 *
 * Source: /System/Library/PrivateFrameworks/iWorkImport.framework/iWorkImport
 */

#import <iWorkImport/iWorkImport-Structs.h>
#import <iWorkImport/GQDDrawable.h>
#import <iWorkImport/XXUnknownSuperclass.h>
#import <iWorkImport/GQWrapPointGenerator.h>

@class GQDAffineGeometry, GQDBezierPath;

__attribute__((visibility("hidden")))
@interface GQDDrawable : XXUnknownSuperclass <GQWrapPointGenerator> {
@private
	GQDAffineGeometry *mGeometry;	// 4 = 0x4
	CFURLRef mUrl;	// 8 = 0x8
	char *mUid;	// 12 = 0xc
	GQDBezierPath *mWrapPath;	// 16 = 0x10
	GQDAffineGeometry *mWrapGeometry;	// 20 = 0x14
	set<GQUtility::ObjcSharedPtr<GQDWrapPoint>,GQUtility::NSObjectComparator<GQDWrapPoint>,std::allocator<GQUtility::ObjcSharedPtr<GQDWrapPoint> > > *mInnerWrapPoints;	// 24 = 0x18
	BOOL mHasPagesOrder;	// 28 = 0x1c
	long mPagesOrder;	// 32 = 0x20
}
- (void)dealloc;	// 0x9469
- (id)geometry;	// 0x8df9
- (CFURLRef)url;	// 0x8e09
- (CFStringRef)urlString;	// 0x9449
- (const char *)uid;	// 0x8e19
- (int)collectWrapPointsForState:(id)state graphicStyle:(id)style;	// 0x9325
- (void)addWrapPoint:(id)point;	// 0x9271
- (const set<GQUtility::ObjcSharedPtr<GQDWrapPoint>,GQUtility::NSObjectComparator<GQDWrapPoint>,std::allocator<GQUtility::ObjcSharedPtr<GQDWrapPoint> > > *)wrapPoints;	// 0x910d
- (vector<GQUtility::ObjcSharedPtr<GQDWrapPoint>,std::allocator<GQUtility::ObjcSharedPtr<GQDWrapPoint> > > *)createListOfWrapPointsAlongY:(float)wrapPointsAlongY minX:(float)x maxX:(float)x3 zIndex:(int)index;	// 0x8f9d
- (void)clearWrapPoints;	// 0x8f75
- (CGPathRef)createBezierPath;	// 0x8ee1
- (BOOL)hasPagesOrder;	// 0x8e29
- (int)pagesOrder;	// 0x8e39
@end

@interface GQDDrawable (Private)
- (void)collectWrapPoints:(id)points forPath:(CGPathRef)path context:(FindLinesContext *)context;	// 0x96c9
@end