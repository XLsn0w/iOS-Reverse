/**
 * This header is generated by class-dump-z 0.2b.
 *
 * Source: /System/Library/PrivateFrameworks/MediaStream.framework/MediaStream
 */




@protocol MSPlatform <NSObject>
- (id)theDaemon;
- (id)authTokenForPersonID:(id)personID;
- (id)baseURLForPersonID:(id)personID;
- (id)socketOptions;
- (BOOL)policyMayDownload;
- (BOOL)policyMayUpload;
- (id)appBundleInfoString;
- (id)OSString;
- (id)hardwareString;
- (id)UDID;
- (Class)sharingPluginClass;
- (Class)subscriberPluginClass;
- (Class)publisherPluginClass;
- (id)pathMediaStreamDir;
- (id)fullNameFromFirstName:(id)firstName lastName:(id)name;
- (void)logFile:(const char *)file func:(const char *)func line:(int)line facility:(int)facility level:(int)level format:(id)format args:(void *)args;
- (void)logFacility:(int)facility level:(int)level format:(id)format args:(void *)args;
- (BOOL)shouldLogAtLevel:(int)level;
@optional
- (id)pushToken;
- (id)pushTokenForPersonID:(id)personID;
@end

