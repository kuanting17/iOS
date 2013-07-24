//
//  SBACCAppDelegate.m
//  SBACC
//
//  Created by Kuanting Chen on 4/15/13.
//  Copyright (c) 2013 Kuanting Chen. All rights reserved.
//

#import "SBACCAppDelegate.h"
#import "ListViewViewController.h"
#import "WebViewController.h"
#import "SBACCFeedStore.h"
#import "WeatherViewController.h"

@implementation SBACCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ListViewViewController *lvc = [[ListViewViewController alloc] initWithStyle:UITableViewStylePlain];
    
    UINavigationController *masterNav = [[UINavigationController alloc] initWithRootViewController:lvc];
    
    WebViewController *wvc = [[WebViewController alloc] init];
    
    [lvc setWebViewController:wvc];
    
    WeatherViewController *vc = [[WeatherViewController alloc] init];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    NSArray *viewControllers = [NSArray arrayWithObjects:masterNav, vc, nil];
    [tabBarController setViewControllers:viewControllers];

    
    [[self window] setRootViewController:masterNav];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
