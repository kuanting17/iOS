//
//  ListViewViewController.m
//  SBACC
//
//  Created by Kuanting Chen on 4/15/13.
//  Copyright (c) 2013 Kuanting Chen. All rights reserved.
//

#import "ListViewViewController.h"
#import "RSSChannel.h"
#import "RSSItem.h"
#import "WebViewController.h"
#import "SBACCFeedStore.h"



@implementation ListViewViewController
@synthesize webViewController;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {        

        UISegmentedControl *rssTypeControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"SBACC", @"Song", nil]];
        [rssTypeControl setSelectedSegmentIndex:0];
        [rssTypeControl setSegmentedControlStyle:UISegmentedControlStyleBar];
        [rssTypeControl addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventValueChanged];
        [[self navigationItem] setTitleView:rssTypeControl];
        [self fetchEntries];
    }
    return self;
}

-(void)changeType:(id)sender
{
    rssType = [sender selectedSegmentIndex];
    [self fetchEntries];
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[self navigationController] pushViewController:webViewController animated:YES];
    
    RSSItem *entry = [[channel items] objectAtIndex:[indexPath row]];
    
    NSURL *url = [NSURL URLWithString:[entry link]];
    
    
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    
    [[webViewController webView] loadRequest:req];
    
    
    [[webViewController navigationItem] setTitle:[entry title]];
}


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
    void (^completionBlock)(RSSChannel *obj, NSError *err) = ^(RSSChannel *obj, NSError *err){
        if(!err){
            channel =obj;
            
            [[self tableView] reloadData];
        }else{
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error" message:[err localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [av show];
        }
    };
    
    if (rssType == ListViewControllerRSSTypeSBACC)
        [[SBACCFeedStore sharedStore] fetchRSSFeedWithCompletion:completionBlock];
    else if (rssType == ListViewControllerRSSTypeApple)
        [[SBACCFeedStore sharedStore] fetchTopSong:10 withCompletion:completionBlock];
}


@end
