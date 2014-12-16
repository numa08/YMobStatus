//
//  NNYmobW303HWClient+RequestSignalStrength.m
//  Pods
//
//  Created by numa08 on 2014/12/07.
//
//

#import "NNYmobW303HWClient+RequestSignalStrength.h"

#import "DDXML.h"

#import "NNYMobW303HWStatusMessage.h"
#import "NNYMobClientConnection.h"

@implementation NNYmobW303HWClient (RequestSignalStrength)
- (NSInteger)requestSignalStrengthWithError:(NSError**)error
{
    NNYMobW303HWStatusMessage *message = [[NNYMobW303HWStatusMessage alloc] initWithSessionID:self.sessionID withTargetURL:self.targetURL];
    NNYMobClientConnection *connection = [[NNYMobClientConnection alloc] init];
    NSInteger signalStrength = 0;
    NSError *myError = nil;
    @try {
        NSData *responseData = [connection requestForMessage:message error:&myError];
        if (myError) {
            @throw myError;
        }
        DDXMLDocument *doc = [[DDXMLDocument alloc] initWithData:responseData options:0 error:&myError];
        if (myError) {
            @throw myError;
        }
        DDXMLNode *node = [doc nodesForXPath:@"/response/SignalIcon" error:&myError].firstObject;
        if (myError) {
            @throw myError;
        }
        signalStrength = node.stringValue.integerValue;
    }
    @catch (NSError *e) {
        if (error) {
            *error = e;
        }
        signalStrength = 0;
    }
    return signalStrength;
}
@end
