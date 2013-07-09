//
//  EventSourceManager.h
//  SSE Test
//
//  Created by Shawn Wall on 7/9/13.
//  Copyright (c) 2013 TwoTap Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventSourceManager : NSObject <UIWebViewDelegate>

+ (EventSourceManager *)sharedManager;
- (void)startListening;
- (void)endListening;

@end
