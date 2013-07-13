//
//  JSONSerializable.h
//  SBACC
//
//  Created by Kuanting Chen on 6/3/13.
//  Copyright (c) 2013 Kuanting Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JSONSerializable <NSObject>

- (void)readFromJSONDictionary:(NSDictionary *)d;

@end
