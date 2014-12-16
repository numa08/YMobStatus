//
//  NNYMobClientConnection.h
//  Pods
//
//  Created by numa08 on 2014/12/07.
//
//

#import <Foundation/Foundation.h>

static NSString *const NNYMobClientMessageURL = @"NNYMobClientMessageURL";
static NSString *const NNYMobClientMessageSessionID = @"NNYMobClientMessageSessionID";

@protocol NNYMobClientMessage <NSObject>
- (NSDictionary*)messageForRequest;
@end

@interface NNYMobClientConnection : NSObject
- (NSData*)requestForMessage:(id<NNYMobClientMessage>)message error:(NSError**)error;
@end