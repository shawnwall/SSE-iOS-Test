//
//  EventSourceManager.m
//  SSE Test
//
//  Created by Shawn Wall on 7/9/13.
//  Copyright (c) 2013 TwoTap Labs. All rights reserved.
//

#import "EventSourceManager.h"
#import "NSURL+Additions.h"

@interface EventSourceManager ()

@property (strong, nonatomic) UIWebView *webView;

-(void)handleParameters:(NSDictionary*)paramaters;

@end

@implementation EventSourceManager

+ (EventSourceManager *)sharedManager {
    static EventSourceManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[EventSourceManager alloc] init];
    });
    
    return _sharedManager;
}

- (void)startListening {
    self.webView = [[UIWebView alloc] init];
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"eventsource" ofType:@"html"]isDirectory:NO]]];
}

- (void)endListening {
    self.webView = nil;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([request.URL.scheme isEqualToString:@"sse"]) {
        [self handleParameters:request.URL.parameterDictionary];            
        return NO;
    }
    return YES;
}

-(void)handleParameters:(NSDictionary*)parameters {
    if ([parameters valueForKey:@"data"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SSEData" object:nil userInfo:@{@"data": [parameters valueForKey:@"data"]}];
    }
}

@end
