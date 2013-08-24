//
//  ListViewViewController.h
//  SBACC
//
//  Created by Kuanting Chen on 4/15/13.
//  Copyright (c) 2013 Kuanting Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSSChannel;
@class WebViewController;

typedef enum {
    ListViewControllerRSSTypeSBACC,
    ListViewControllerRSSTypeApple
} ListViewControllerRSSType;

@interface ListViewViewController : UITableViewController
{
    RSSChannel *channel;
    ListViewControllerRSSType rssType;
}
@property (nonatomic, strong)WebViewController *webViewController;

-(void)fetchEntries;

@end
