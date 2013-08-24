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
#import "weatherItem.h"
#import "WeatherViewController.h"
#import "SBACCFeedStore.h"
#import "WeatherViewController.h"
#import "JSONSerializable.h"

@implementation WeatherViewController




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSBundle *appBundle = [NSBundle mainBundle];
    
    self = [super initWithNibName:@"WeatherViewController"
                           bundle:appBundle];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Weather"];
        UIImage *i = [UIImage imageNamed:@"Weather.png"];
        [tbi setImage:i];
        list = [[weatherItem alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSError *error = nil;
    NSURLResponse *response = nil;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: @"http://api.worldweatheronline.com/free/v1/weather.ashx?q=Mountain+View&format=json&num_of_days=5&key=gxf6yfgwscm6pbqzk8a4hbs8"]];
    [request setHTTPMethod:@"GET"];
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if(jsonData)
    {
        {
            {
                NSDictionary *dictionaryFromJSON = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
                NSLog( @"ya got it");
                NSDictionary *data = [dictionaryFromJSON objectForKey:@"data"];
                NSArray *currentCondition = [data objectForKey:@"current_condition"];
                NSDictionary *condition = [currentCondition objectAtIndex:0];
                {
                    NSNumber *tempF = [condition objectForKey:@"temp_F"];
                    NSNumber *tempC = [condition objectForKey:@"temp_C"];
                    int temp = [tempC intValue];
                    
                    NSArray *weatherDescArray = [condition objectForKey:@"weatherDesc"];
                    NSDictionary *weatherDesc = [weatherDescArray objectAtIndex:0];
                    NSString *weatherDescValue = [weatherDesc objectForKey:@"value"];
                    
                    NSArray *iconUrlArray = [condition objectForKey:@"weatherIconUrl"];
                    NSDictionary *iconUrl = [iconUrlArray objectAtIndex:0];
                    NSString *iconUrlValue = [iconUrl objectForKey:@"value"];
                    
                    UIImage * result;
                    NSData * imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:iconUrlValue]];
                    result = [UIImage imageWithData:imageData];
                    NSLog(@"temp %d", temp);
                    NSLog(@"Url %@", iconUrlValue);
                    NSLog(@"Desc %@", weatherDescValue);
                    
                    NSArray *request = [data objectForKey:@"request"];
                    NSDictionary *query = [request objectAtIndex:0];
                    NSString *city = [query objectForKey:@"query"];
                    
                    [list setCity:city];
                    [list setTemperature: [tempF intValue]];
                    [list setWeatherDesc: weatherDescValue];
                    [list setWeatherImage:result];
                    
                    NSLog(@"temp2 %d", [list temperature]);
                    NSLog(@"desc2 %@", [list weatherDesc]);
                }
                NSArray *weather = [data objectForKey:@"weather"];
                for (NSDictionary *day in weather)
                {
                
//                    NSNumber *tempMaxF = [day objectForKey:@"tempMaxF"];
//                    NSNumber *tempMinF = [day objectForKey:@"tempMinF"];
//                    NSArray *iconUrlArray = [day objectForKey:@"weatherIconUrl"];
//                    NSDictionary *iconUrl = [iconUrlArray objectAtIndex:0];
//                    NSString *iconUrlValue = [iconUrl objectForKey:@"value"];
//                    
//                    NSArray *weatherDescArray = [condition objectForKey:@"weatherDesc"];
//                    NSDictionary *weatherDesc = [weatherDescArray objectAtIndex:0];
//                    NSString *weatherDescValue = [weatherDesc objectForKey:@"value"];
                    
                    
                    /*int temp = [tempMaxF intValue];
                    NSLog(@"Max %d", temp);
                    temp = [tempMinF intValue];
                    NSLog(@"Min %d", temp);
                    NSLog(@"Url %@", iconUrlValue);
                    NSLog(@"Desc %@", weatherDescValue);*/
                    
//                    UIImage * result;
//                    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString: iconUrlValue]];
//                    result = [UIImage imageWithData:data];
                    
                }
            }
            
        }
    }
    [super viewWillAppear:animated];
    
    [cityText setText:[list city]];
    [temperatureText setText:[NSString stringWithFormat:@"%d", [list temperature]]];
    [conditionText setText:[list weatherDesc]];
    [weatherView setImage:[list weatherImage]];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
