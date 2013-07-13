//
//  SBACCConnection.h
//  SBACC
//
//  Created by Kuanting Chen on 5/12/13.
//  Copyright (c) 2013 Kuanting Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONSerializable.h"

@interface SBACCConnection : NSObject<NSURLConnectionDelegate, NSURLConnectionDataDelegate>{
    NSURLConnection *internalConnection;
    NSMutableData *container;
}

- (id)initWithRequest:(NSURLRequest *)req;

@property(nonatomic, copy) NSURLRequest *request;
@property(nonatomic, copy) void (^completionBlock)(id obj, NSError *err);
@property(nonatomic, strong) id <NSXMLParserDelegate> xmlRootobject;
@property(nonatomic, strong) id <JSONSerializable> jsonRootObject;

- (void)start;

@end
