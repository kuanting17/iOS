//
//  WeatherViewController.m
//  SBACC
//
//  Created by Kuanting Chen on 7/23/13.
//  Copyright (c) 2013 Kuanting Chen. All rights reserved.
//

#import "WeatherViewController.h"

@interface WeatherViewController ()

@end

#import "RSSChannel.h"
#import "RSSItem.h"
#import "SBACCFeedStore.h"

@implementation WeatherViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Weather"];
    }
    return self;
}

-(void)changeType:(id)sender
{
//    rssType = [sender selectedSegmentIndex];
    [self fetchEntries];
}

//- (void)tableView:(UITableView *)tableView
//didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [[self navigationController] pushViewController:webViewController animated:YES];
//    
//    RSSItem *entry = [[channel items] objectAtIndex:[indexPath row]];
//    
//    NSURL *url = [NSURL URLWithString:[entry link]];
//    
//    
//    NSURLRequest *req = [NSURLRequest requestWithURL:url];
//    
//    
//    [[webViewController webView] loadRequest:req];
//    
//    
//    [[webViewController navigationItem] setTitle:[entry title]];
//}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[channel items] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"UITableViewCell"];
    }
    RSSItem *item = [[channel items] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[item title]];
    
    return cell;
}

- (void)fetchEntries
{
    [[SBACCFeedStore sharedStore] fetchRSSFeedWithCompletion: ^(RSSChannel *obj, NSError *err){
        if(!err){
            channel =obj;
            [[self tableView] reloadData];
        }else{
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error" message:[err localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [av show];
        }
    }];
}

@end
