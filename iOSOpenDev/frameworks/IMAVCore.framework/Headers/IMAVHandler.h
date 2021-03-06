/**
 * This header is generated by class-dump-z 0.2b.
 *
 * Source: /System/Library/PrivateFrameworks/IMAVCore.framework/IMAVCore
 */

#import <IMAVCore/XXUnknownSuperclass.h>

@class NSMutableArray, NSTimer;

__attribute__((visibility("hidden")))
@interface IMAVHandler : XXUnknownSuperclass {
	NSMutableArray *_wifiActivationQueue;	// 4 = 0x4
	NSTimer *_wiFiQueueTimer;	// 8 = 0x8
}
+ (void)ensureHandlerSetup;	// 0x6359
+ (void)initialize;	// 0x62d5
- (void)videoStillForPersonRequested:(id)personRequested withTransactionID:(unsigned)transactionID;	// 0xc599
- (void)audioReflectorRequested:(BOOL)requested transactionID:(unsigned)anId;	// 0xc4e5
- (void)currentAVChatInfoRequestedWithTransactionID:(unsigned)transactionID;	// 0xc485
- (void)account:(id)account relay:(id)relay handleCancel:(id)cancel fromPerson:(id)person;	// 0xc2e1
- (void)account:(id)account relay:(id)relay handleUpdate:(id)update fromPerson:(id)person;	// 0xc13d
- (void)account:(id)account relay:(id)relay handleInitate:(id)initate fromPerson:(id)person;	// 0xbf8d
- (void)account:(id)account postedError:(id)error;	// 0xb84d
- (void)persistentProperty:(id)property changedTo:(id)to from:(id)from;	// 0xb719
- (void)property:(id)property changedTo:(id)to from:(id)from;	// 0xb5e1
- (void)account:(id)account conference:(id)conference peerID:(id)anId propertiesUpdated:(id)updated;	// 0xb4f1
- (void)setupComplete;	// 0xb325
- (void)pendingVCRequestComplete;	// 0xb2e1
- (void)vcCapabilitiesChanged:(unsigned long long)changed;	// 0xb2a5
- (void)account:(id)account conference:(id)conference cancelRequestInvitationWithBuddy:(id)buddy;	// 0xb129
- (void)account:(id)account conference:(id)conference notifyMissedInvitationWithBuddy:(id)buddy;	// 0xafad
- (void)account:(id)account conference:(id)conference requestInvitationWithBuddy:(id)buddy;	// 0xae31
- (void)_handleIncomingAVChatForNotification:(id)notification;	// 0xaaed
- (void)_enqueueIMAVChatForWiFiActivation:(id)wiFiActivation;	// 0xa901
- (void)_notifyOfIncomingInvitationFor:(id)aFor notifyInvitationListeners:(BOOL)listeners;	// 0xa849
- (void)_notifyInvitationFor:(id)aFor;	// 0xa6a9
- (void)_notifyMissedInvitationFor:(id)aFor;	// 0xa3e9
- (void)_checkWiFiQueue:(id)queue;	// 0x9a9d
- (void)_clearWiFiActivationQueue;	// 0x9a5d
- (void)_setWiFiActivationTimer;	// 0x9959
- (void)account:(id)account conference:(id)conference requestSendResponseWithResult:(int)result toPerson:(id)person;	// 0x9441
- (void)account:(id)account conference:(id)conference changedToNewConferenceID:(id)newConferenceID;	// 0x9135
- (void)account:(id)account conference:(id)conference peerIDChangedFromID:(id)anId toID:(id)anId4;	// 0x8fb1
- (void)account:(id)account conference:(id)conference receivedAVMessage:(unsigned)message from:(id)from sessionID:(unsigned)anId userInfo:(id)info;	// 0x8ef9
- (void)account:(id)account conference:(id)conference receivedUpdateFrom:(id)from data:(id)data;	// 0x8e21
- (void)account:(id)account conference:(id)conference receivedCancelInvitationFrom:(id)from properties:(id)properties;	// 0x8ac5
- (void)account:(id)account conference:(id)conference receivedResponseToInvitationFrom:(id)from properties:(id)properties;	// 0x884d
- (void)account:(id)account conference:(id)conference receivedCounterProposalFrom:(id)from properties:(id)properties;	// 0x877d
- (void)account:(id)account conference:(id)conference receivedInvitationFrom:(id)from properties:(id)properties;	// 0x6511
- (void)dealloc;	// 0x64c5
@end
