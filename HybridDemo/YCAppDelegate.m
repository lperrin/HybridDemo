//
//  YCAppDelegate.m
//  HybridDemo
//
//  Created by Laurent Perrin on 09/07/14.
//  Copyright (c) 2014 Yourcompany. All rights reserved.
//

#import "YCAppDelegate.h"

#import "YCJSBridge.h"

@implementation YCAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Show notifications even if app is in foreground
    if ([NSUserNotificationCenter class])
        [[NSUserNotificationCenter defaultUserNotificationCenter] setDelegate:self];

    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"app" ofType:@"html"];
    NSString *html = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    
    [self.web setFrameLoadDelegate:self];
    [self.web setUIDelegate:self];
    [self.web setPolicyDelegate:self];

    [[self.web mainFrame] loadHTMLString:html baseURL:[NSURL fileURLWithPath: [[NSBundle mainBundle] bundlePath]]];
    
    bridge = [[YCJSBridge alloc] init];
}

- (void)runJavaScript:(NSString *)command
{
    NSLog(@"js: %@", command);
    [self.web stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"if (typeof jsapi !== 'undefined') %@;", command]];
}

- (IBAction)callJS:(id)sender
{
    [self runJavaScript:@"jsapi.incrementCounter();"];
}

- (void)webView:(WebView *)webView didClearWindowObject:(WebScriptObject *)windowObject forFrame:(WebFrame *)frame
{
    // Inject native bridge in webview
    id win = [self.web windowScriptObject];
    [win setValue:bridge forKey:@"osx"];
}

- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center
     shouldPresentNotification:(NSUserNotification *)notification
{
    return YES;
}

@end
