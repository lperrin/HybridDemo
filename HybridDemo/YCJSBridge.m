//
//  YCJSBridge.m
//  HybridDemo
//
//  Created by Laurent Perrin on 09/07/14.
//  Copyright (c) 2014 Yourcompany. All rights reserved.
//

#import "YCJSBridge.h"

@implementation YCJSBridge

- (void)sendNotification:(NSString *)title message:(NSString *)message link:(NSString *)link
{
    if ([NSUserNotification class]) {
        NSUserNotification *notification = [[NSUserNotification alloc] init];
        notification.title = title;
        notification.informativeText = message;
        notification.hasActionButton = YES;
        notification.actionButtonTitle = @"View";
        notification.soundName = NSUserNotificationDefaultSoundName;
        notification.userInfo = [NSDictionary dictionaryWithObject:link forKey:@"link"];
        
        [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:notification];
    }
}

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)sel
{
    return NO;
}

+ (BOOL)isKeyExcludedFromWebScript:(const char *)name
{
    return NO;
}

@end
