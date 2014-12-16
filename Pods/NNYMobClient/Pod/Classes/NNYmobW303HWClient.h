//
//  NNYmobW303HWClient.h
//  Pods
//
//  Created by numa08 on 2014/12/04.
//
//

#import "NNYMobClient.h"

@interface NNYmobW303HWClient : NNYMobClient
- (id)initWithIPAddress:(NSString*)ipaddress;
@property (nonatomic, copy) NSString *sessionID;
@property (nonatomic, copy) NSString *ipaddress;
@property (nonatomic, readonly) NSURL *targetURL;
@end
