//
//  WebViewController.m
//  SBACC
//
//  Created by Kuanting Chen on 4/15/13.
//  Copyright (c) 2013 Kuanting Chen. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController
- (void)loadView
{
    
    CGRect screenFrame = [[UIScreen mainScreen] applicationFrame];
    UIWebView *wv = [[UIWebView alloc] initWithFrame:screenFrame];
    [wv setScalesPageToFit:YES];
    [self setView:wv];
}

- (UIWebView *)webView
{
    return (UIWebView *)[self view];
}

@end
