/**
 * This header is generated by class-dump-z 0.2b.
 *
 * Source: /System/Library/PrivateFrameworks/SoftwareUpdateServices.framework/SoftwareUpdateServices
 */

#import <SoftwareUpdateServices/XXUnknownSuperclass.h>
#import <SoftwareUpdateServices/NSCoding.h>


@interface SUDownloadInterfaceReport : XXUnknownSuperclass <NSCoding> {
@private
	BOOL _downloadedOverWiFi;	// 4 = 0x4
	BOOL _downloadedOverCellular;	// 5 = 0x5
	BOOL _hasBeenReported;	// 6 = 0x6
}
@property(assign, nonatomic) BOOL hasBeenReported;	// G=0x17641; S=0x17651; @synthesize=_hasBeenReported
@property(assign, nonatomic) BOOL hasDownloadedOverCellular;	// G=0x17621; S=0x17631; @synthesize=_downloadedOverCellular
@property(assign, nonatomic) BOOL hasDownloadedOverWiFi;	// G=0x17601; S=0x17611; @synthesize=_downloadedOverWiFi
// declared property setter: - (void)setHasBeenReported:(BOOL)reported;	// 0x17651
// declared property getter: - (BOOL)hasBeenReported;	// 0x17641
// declared property setter: - (void)setHasDownloadedOverCellular:(BOOL)cellular;	// 0x17631
// declared property getter: - (BOOL)hasDownloadedOverCellular;	// 0x17621
// declared property setter: - (void)setHasDownloadedOverWiFi:(BOOL)fi;	// 0x17611
// declared property getter: - (BOOL)hasDownloadedOverWiFi;	// 0x17601
- (void)encodeWithCoder:(id)coder;	// 0x17589
- (id)initWithCoder:(id)coder;	// 0x174ed
- (BOOL)reportDownloadInterface:(BOOL)interface;	// 0x173e9
- (BOOL)updateDownloadInterface:(int)interface;	// 0x173b5
@end
