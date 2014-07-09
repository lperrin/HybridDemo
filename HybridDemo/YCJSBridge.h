//
//  YCJSBridge.h
//  HybridDemo
//
//  Created by Laurent Perrin on 09/07/14.
//  Copyright (c) 2014 Yourcompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCJSBridge : NSObject

- (void)sendNotification:(NSString *)title message:(NSString *)message link:(NSString *)link;

@end