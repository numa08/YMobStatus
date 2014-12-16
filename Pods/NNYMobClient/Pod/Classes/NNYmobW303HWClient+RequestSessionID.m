//
//  NNYmobW303HWClient+RequestSessionID.m
//  Pods
//
//  Created by numa08 on 2014/12/07.
//
//

#import "NNYmobW303HWClient+RequestSessionID.h"

@implementation NNYmobW303HWClient (RequestSessionID)
# pragma mark - NNYmobClient Method
- (NSString*)requestSessionIDWithError:(NSError **)error
{
    NSError *myError = nil;
    NSHTTPURLResponse *response = nil;
    NSURLRequest *request = [NSURLRequest requestWithURL:self.targetURL];
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&myError];
    NSString *sessionID = nil;
    @try {
        if (myError) {
            @throw myError;
        }
        if (response.statusCode != 200) {
            NSString *message = [NSString stringWithFormat:@"failed GET to %@, status code is %@", self.targetURL, @(response.statusCode)];
            @throw [NSError errorWithDomain:NNYMobErrorDomain code:NNYMobErrorCodeHttpRequestFAILED userInfo:@{NSLocalizedDescriptionKey : message}];
        }
        NSArray *responseCookie = [NSHTTPCookie cookiesWithResponseHeaderFields:response.allHeaderFields forURL:response.URL];
        NSPredicate *filter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
            return [[evaluatedObject valueForKey:@"name"] isEqualToString:@"SessionID"];
        }];
        NSHTTPCookie *sessionIDCookie = [responseCookie filteredArrayUsingPredicate:filter].firstObject;
        if (sessionIDCookie == nil) {
            NSString *message = @"session id is null";
            @throw [NSError errorWithDomain:NNYMobErrorDomain code:NNYMobErrorCodeSessionIDIsNULL userInfo:@{NSLocalizedDescriptionKey : message}];
        }
        sessionID = sessionIDCookie.value;
    }
    @catch (NSError *e) {
        sessionID = nil;
        if (error) {
            *error = e;
        }
    }
    @finally {
        return sessionID;
    }
}
@end
