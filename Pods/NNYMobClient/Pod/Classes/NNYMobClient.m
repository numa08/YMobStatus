//
//  NNYMobClient.m
//  Pods
//
//  Created by numa08 on 2014/12/02.
//
//

#import "NNYMobClient.h"

#import "NNYmobW303HWClient.h"

@implementation NNYMobClient
+ (id<NNYMobClient>)clientForName:(NSString *)name withIPAddress:(NSString *)ipaddress
{
    if ([name isEqualToString:NNYMobW303HW]) {
        return (id<NNYMobClient>)[[NNYmobW303HWClient alloc] initWithIPAddress:ipaddress];
    }
    return nil;
}
@end