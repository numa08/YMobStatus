//
//  NNYMobClientConnection.m
//  Pods
//
//  Created by numa08 on 2014/12/07.
//
//

#import "NNYMobClientConnection.h"
#import "NNYMobClientError.h"

static NSString *const NNYMobClientCookieSessionID = @"SessionID";

@implementation NNYMobClientConnection
- (NSData*)requestForMessage:(id<NNYMobClientMessage>)message error:(NSError**)error
{
    NSDictionary *params = [message messageForRequest];
    NSURL *url = params[NNYMobClientMessageURL];
    NSString *sessionID = params[NNYMobClientMessageSessionID];
    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:@{NSHTTPCookiePath : @"/",
                                                                NSHTTPCookieName : NNYMobClientCookieSessionID,
                                                                NSHTTPCookieValue : sessionID,
                                                                NSHTTPCookieDomain : url.host}];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSDictionary *header = [NSHTTPCookie requestHeaderFieldsWithCookies:@[cookie]];
    request.allHTTPHeaderFields = header;
    
    NSHTTPURLResponse *response = nil;
    NSError *myerror = nil;
    NSData *responseBody = nil;
    @try {
        responseBody = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&myerror];
        if (myerror) {
            @throw myerror;
        }
        if (response.statusCode != 200) {
            NSString *message = [NSString stringWithFormat:@"GET %@ connection failed. Status code is %@", response.URL, @(response.statusCode)];
            NSError *e = [NSError errorWithDomain:NNYMobErrorDomain code:NNYMobErrorCodeHttpRequestFAILED userInfo:@{NSLocalizedDescriptionKey : message}];
            @throw e;
        }
    }
    @catch (NSError *e) {
        if (error) {
            *error = e;
        }
    }
    
    return responseBody;
}
@end
