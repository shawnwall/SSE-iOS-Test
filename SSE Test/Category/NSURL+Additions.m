//
//  NSURL+Additions.m
//
//  Created by Shawn Wall on 9/3/12.
//  Copyright (c) 2012 TwoTap Labs. All rights reserved.
//

#import "NSURL+Additions.h"

@implementation NSURL (Additions)

- (NSArray *)parameterArray {
    
    if (![self query]) return nil;
    NSScanner *scanner = [NSScanner scannerWithString:[self query]];
    if (!scanner) return nil;
    
    NSMutableArray *array = [NSMutableArray array];
    
    NSString *key;
    NSString *val;
    while (![scanner isAtEnd]) {
        if (![scanner scanUpToString:@"=" intoString:&key]) key = nil;
        [scanner scanString:@"=" intoString:nil];
        if (![scanner scanUpToString:@"&" intoString:&val]) val = nil;
        [scanner scanString:@"&" intoString:nil];
        
        key = [key stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        val = [val stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        if (key) [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                   key, @"key", val, @"value", nil]];
    }
    return array;
}


- (NSDictionary *)parameterDictionary {
    if (![self query]) return nil;
    NSArray *parameterArray = [self parameterArray];
    
    NSArray *keys = [parameterArray valueForKey:@"key"];
    NSArray *values = [parameterArray valueForKey:@"value"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    return dictionary;
}

@end
