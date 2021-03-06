/**
 * This header is generated by class-dump-z 0.2b.
 *
 * Source: /System/Library/PrivateFrameworks/iAdCore.framework/iAdCore
 */

#import <iAdCore/iAdCore-Structs.h>
#import <iAdCore/ADWebViewDelegate.h>


@protocol ADStoryboardWebViewDelegate <ADWebViewDelegate>
- (int)interfaceOrientation;
- (CGRect)bannerRectOnScreen;
- (CGPoint)tapLocation;
- (id)bannerParameters;
- (void)webViewDidTakeScreenShot:(id)webView;
- (void)webViewWillTakeScreenShot:(id)webView;
- (void)storyboardWebView:(id)view didChangeSupportedInterfaceOrientations:(unsigned)orientations;
- (id)storyboardWebViewHumanReadableContentName:(id)name;
- (void)webViewContentSignalsReady:(id)ready;
- (void)webView:(id)view requestsDismissPopoverViewControllerAnimated:(BOOL)animated;
- (void)webView:(id)view requestsDismissModalViewControllerAnimated:(BOOL)animated;
- (void)webView:(id)view requestsPresentPopoverViewController:(id)controller fromRect:(CGRect)rect animated:(BOOL)animated;
- (void)webView:(id)view requestsPresentModalViewController:(id)controller animated:(BOOL)animated;
- (void)storyboardWebViewContentRequestsGeolocation:(id)geolocation approval:(id)approval;
- (void)storyboardWebViewPrivilegedAdWantsToDismiss:(id)dismiss;
@optional
- (void)webView:(id)view didReportSystemEventWithType:(int)type;
- (void)webView:(id)view didReportEventWithMessage:(id)message;
@end
