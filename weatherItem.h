//
//  weatherItem.h
//  SBACC
//
//  Created by Kuanting Chen on 7/27/13.
//  Copyright (c) 2013 Kuanting Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface weatherItem : NSObject
{
    
}

- (id)initWithCity:(NSString *)c
       temperature:(int)t
      weatherDesc:(NSString *)wd
       weatherView:(UIImage *)wv;


@property (nonatomic, copy) NSString *city;
@property (nonatomic) int temperature;
@property (nonatomic, copy) NSString *weatherDesc;
@property (nonatomic, copy) UIImage *weatherImage;

@end
