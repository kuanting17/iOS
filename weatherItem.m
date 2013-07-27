//
//  weatherItem.m
//  SBACC
//
//  Created by Kuanting Chen on 7/27/13.
//  Copyright (c) 2013 Kuanting Chen. All rights reserved.
//

#import "weatherItem.h"

@implementation weatherItem
@synthesize city, temperature, weatherDesc, weatherImage;

- (id)initWithCity:(NSString *)c
       temperature:(int)t
       weatherDesc:(NSString *)wd
       weatherImage:(UIImage *)wv;
{
    self = [super init];
    if (self) {
        [self setCity:c];
        [self setTemperature:t];
        [self setWeatherDesc:wd];
        [self setWeatherImage:wv];
    }
    return self;
}


@end
