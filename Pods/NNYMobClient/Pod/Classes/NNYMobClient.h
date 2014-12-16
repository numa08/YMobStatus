//
//  NNYMobClient.h
//  Pods
//
//  Created by numa08 on 2014/12/02.
//
//

#import <Foundation/Foundation.h>
#import "NNYMobClientError.h"

// Supported Clients
static NSString *const NNYMobW303HW = @"W303H";
@protocol NNYMobClient <NSObject>
@property (nonatomic, copy) NSString *sessionID;
- (NSString*)requestSessionIDWithError:(NSError**)error;
- (NSInteger)requestSignalStrengthWithError:(NSError**)error;
@end

@interface NNYMobClient : NSObject
+ (id<NNYMobClient>)clientForName:(NSString*)name withIPAddress:(NSString*)ipaddress;
@property (nonatomic, readonly) NSString *name;
@end