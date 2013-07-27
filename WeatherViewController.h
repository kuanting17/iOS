//
//  WeatherViewController.h
//  SBACC
//
//  Created by Kuanting Chen on 7/23/13.
//  Copyright (c) 2013 Kuanting Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class weatherItem;

@interface WeatherViewController : UIViewController
{
    __weak IBOutlet UITextField *cityText;
    __weak IBOutlet UITextField *temperatureText;
    __weak IBOutlet UITextField *conditionText;
    __weak IBOutlet UIImageView *weatherView;
    
    weatherItem *list;
}
-(void)fetchEntries;

//@property (nonatomic, strong)weatherItem *list;


@end
