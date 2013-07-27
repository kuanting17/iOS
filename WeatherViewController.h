//
//  WeatherViewController.h
//  SBACC
//
//  Created by Kuanting Chen on 7/23/13.
//  Copyright (c) 2013 Kuanting Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSSChannel;

@interface WeatherViewController : UITableViewController
{
    RSSChannel *channel;
}
-(void)fetchEntries;


@end
