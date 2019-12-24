/**
 * This header is generated by class-dump-z 0.2b.
 *
 * Source: /System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DABookmarkDAV.framework/DABookmarkDAV
 */

#import <AccountSettings/_kAccountClass.h>
#import <DABookmarkDAV/CoreDAVAccountInfoProvider.h>
#import <DABookmarkDAV/CoreDAVLogDelegate.h>
#import <DABookmarkDAV/CoreDAVDiscoveryTaskGroupDelegate.h>

@class BookmarkDAVTaskManager, CoreDAVDiscoveryTaskGroup, DACoreDAVLogger;

@interface BookmarkDAVAccount : _kAccountClass <CoreDAVAccountInfoProvider, CoreDAVLogDelegate, CoreDAVDiscoveryTaskGroupDelegate> {
	BookmarkDAVTaskManager *_taskManager;	// 64 = 0x40
	CoreDAVDiscoveryTaskGroup *_checkValidityTaskGroup;	// 68 = 0x44
	DACoreDAVLogger *_curLogger;	// 72 = 0x48
}
@property(assign) int bookmarkDAVAccountVersion;	// G=0x2449; S=0x2465; 
@property(retain) id serverComplianceClasses;	// G=0x279d; S=0x27a1; converted property
@property(retain) id serverRoot;	// G=0x2441; S=0x2445; converted property
@property(assign) BOOL useSSL;	// G=0x23b9; S=0x23d9; converted property
@property(retain) id scheme;	// G=0x2381; S=0x239d; converted property
@property(assign) int port;	// G=0x2349; S=0x2365; converted property
@property(retain) id host;	// G=0x22b1; S=0x22cd; converted property
@property(retain) id username;	// G=0x2219; S=0x2235; converted property
@property(retain) id principalURL;	// G=0x2125; S=0x2099; converted property
@property(readonly, retain) BookmarkDAVTaskManager *taskManager;	// G=0x1b75; converted property
+ (id)supportedDataclasses;	// 0x1405
+ (Class)clientClass;	// 0x13e9
+ (Class)accountClass;	// 0x13cd
+ (id)defaultProperties;	// 0x10d9
- (void)coreDAVTransmittedDataFinished;	// 0x2901
- (void)coreDAVLogTransmittedDataPartial:(id)partial;	// 0x28e1
- (BOOL)shouldLogTransmittedData;	// 0x28d5
- (void)coreDAVLogDiagnosticMessage:(id)message atLevel:(int)level;	// 0x2891
- (int)coreDAVOutputLevel;	// 0x2889
- (int)coreDAVLogLevel;	// 0x2871
- (BOOL)handleCertificateError:(id)error;	// 0x286d
- (BOOL)handleTrustChallenge:(id)challenge;	// 0x283d
- (void)promptUserForNewCoreDAVPasswordWithCompletionBlock:(id)completionBlock;	// 0x27a9
- (id)userAgentHeader;	// 0x27a5
// converted property setter: - (void)setServerComplianceClasses:(id)classes;	// 0x27a1
// converted property getter: - (id)serverComplianceClasses;	// 0x279d
- (id)localizedInvalidPasswordMessage;	// 0x26ed
- (id)localizedIdenticalAccountFailureMessage;	// 0x2675
- (BOOL)isEqualToAccount:(id)account;	// 0x2481
// declared property setter: - (void)setBookmarkDAVAccountVersion:(int)version;	// 0x2465
// declared property getter: - (int)bookmarkDAVAccountVersion;	// 0x2449
// converted property setter: - (void)setServerRoot:(id)root;	// 0x2445
// converted property getter: - (id)serverRoot;	// 0x2441
// converted property setter: - (void)setUseSSL:(BOOL)ssl;	// 0x23d9
// converted property getter: - (BOOL)useSSL;	// 0x23b9
// converted property setter: - (void)setScheme:(id)scheme;	// 0x239d
// converted property getter: - (id)scheme;	// 0x2381
// converted property setter: - (void)setPort:(int)port;	// 0x2365
// converted property getter: - (int)port;	// 0x2349
// converted property setter: - (void)setHost:(id)host;	// 0x22cd
// converted property getter: - (id)host;	// 0x22b1
// converted property setter: - (void)setUsername:(id)username;	// 0x2235
// converted property getter: - (id)username;	// 0x2219
- (void)noteHomeSetOnDifferentHost:(id)host;	// 0x216d
// converted property getter: - (id)principalURL;	// 0x2125
// converted property setter: - (void)setPrincipalURL:(id)url;	// 0x2099
- (BOOL)accountNeedsUpgrade;	// 0x1fa5
- (BOOL)upgradeAccount;	// 0x1f1d
- (BOOL)_upgradeSelfFromVersion:(int)version superClassUpgraded:(BOOL)upgraded;	// 0x1d59
- (id)_oldURLsForKeychain;	// 0x1c31
- (id)stateString;	// 0x1bc9
// converted property getter: - (id)taskManager;	// 0x1b75
- (void)discoveryTask:(id)task gotAccountInfo:(id)info error:(id)error;	// 0x19e5
- (id)_validationErrorFromRawError:(id)rawError;	// 0x1795
- (void)setShouldFailAllTasks:(BOOL)failAllTasks;	// 0x1751
- (void)checkValidityWithConsumer:(id)consumer;	// 0x1431
- (BOOL)supportsDADataclass:(int)dataclass;	// 0x1425
- (void)dealloc;	// 0x1321
- (id)initWithProperties:(id)properties;	// 0x124d
- (id)init;	// 0x120d
@end