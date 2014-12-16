//
//  NNYMobW303HWStatusMessage.m
//  Pods
//
//  Created by numa08 on 2014/12/07.
//
//

#import "NNYMobW303HWStatusMessage.h"

@implementation NNYMobW303HWStatusMessage
- (id)init
{
    self = [super init];
    if (self) {
        _sessionID = @"";
        _targetURL = [[NSURL alloc] init];
    }
    return self;
}

- (id)initWithSessionID:(NSString*)sessionID withTargetURL:(NSURL*)url
{
    self = [super init];
    if (self) {
        _sessionID = sessionID;
        _targetURL = url;
    }
    return self;
}

- (NSDictionary*)messageForRequest
{
    NSURL *targetURL = [self.targetURL URLByAppendingPathComponent:NNYMobW303HWStatusPath];
    NSDictionary *retval = @{NNYMobClientMessageSessionID : self.sessionID,
                             NNYMobClientMessageURL : targetURL};
    return retval;
}
@end
