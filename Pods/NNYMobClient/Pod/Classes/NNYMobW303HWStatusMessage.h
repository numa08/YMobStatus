//
//  NNYMobW303HWStatusMessage.h
//  Pods
//
//  Created by numa08 on 2014/12/07.
//
//

#import <Foundation/Foundation.h>
#import "NNYMobClientConnection.h"

static NSString *const NNYMobW303HWStatusPath = @"api/monitoring/status";

@interface NNYMobW303HWStatusMessage : NSObject<NNYMobClientMessage>
@property (nonatomic, readonly) NSString *sessionID;
@property (nonatomic, readonly) NSURL *targetURL;
- (id)initWithSessionID:(NSString*)sessionID withTargetURL:(NSURL*)url;
@end
