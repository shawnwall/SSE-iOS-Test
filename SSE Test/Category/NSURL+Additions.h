//
//  NSURL+Additions.h
//
//  Created by Shawn Wall on 9/3/12.
//  Copyright (c) 2012 TwoTap Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Additions)

- (NSArray *)parameterArray;
- (NSDictionary *)parameterDictionary;

@end
