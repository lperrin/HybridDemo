//
//  YCAppDelegate.h
//  HybridDemo
//
//  Created by Laurent Perrin on 09/07/14.
//  Copyright (c) 2014 Yourcompany. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@class YCJSBridge;

@interface YCAppDelegate : NSObject <NSApplicationDelegate, NSUserNotificationCenterDelegate> {
    YCJSBridge *bridge;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet WebView *web;

@end
