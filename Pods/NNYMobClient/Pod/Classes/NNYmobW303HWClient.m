//
//  NNYmobW303HWClient.m
//  Pods
//
//  Created by numa08 on 2014/12/04.
//
//

#import "NNYmobW303HWClient.h"
#import "NNYmobW303HWClient+RequestSessionID.h"

@interface NNYmobW303HWClient()
@end

@implementation NNYmobW303HWClient

- (id)initWithIPAddress:(NSString *)ipaddress
{
    self = [super init];
    if (self) {
        self.ipaddress = ipaddress;
    }
    return self;
}

- (NSString*)name
{
    return NNYMobW303HW;
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol
{
    if (aProtocol == @protocol(NNYMobClient)) {
        return YES;
    }
    return NO;
}

# pragma mark - Private Methods
- (NSURL*)targetURL
{
    NSString *scheme = @"http";
    NSString *host = self.ipaddress;
    NSString *path = @"/";
    NSURL *url = [[NSURL alloc] initWithScheme:scheme host:host path:path];
    return url;
}
@end
