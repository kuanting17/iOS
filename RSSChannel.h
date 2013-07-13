//
//  RSSChannel.h
//  SBACC
//
//  Created by Kuanting Chen on 4/15/13.
//  Copyright (c) 2013 Kuanting Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONSerializable.h"

@interface RSSChannel : NSObject<NSXMLParserDelegate, JSONSerializable>
{
    NSMutableString *currentString;
}

@property (nonatomic, weak) id parentParserDelegate;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *infoString;
@property (nonatomic, readonly, strong) NSMutableArray *items;


@end
