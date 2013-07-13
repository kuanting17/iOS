//
//  SBACCConnection.m
//  SBACC
//
//  Created by Kuanting Chen on 5/12/13.
//  Copyright (c) 2013 Kuanting Chen. All rights reserved.
//

#import "SBACCConnection.h"

static NSMutableArray *sharedConnectionList = nil;

@implementation SBACCConnection
@synthesize request, completionBlock, xmlRootobject, jsonRootObject;

- (id)initWithRequest:(NSURLRequest *)req
{
    self = [super init];
    if (self) {
        [self setRequest:req];
    }
    return self;
}

- (void)start
{
    container = [[NSMutableData alloc]init];
    internalConnection = [[NSURLConnection alloc] initWithRequest:[self request] delegate:self startImmediately:YES];
    
    if (!sharedConnectionList) {
        sharedConnectionList = [[NSMutableArray alloc] init];
        [sharedConnectionList addObject:self];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [container appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    id rootObject = nil;
    if ([self xmlRootobject]) {
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:container];
        [parser setDelegate:[self xmlRootobject]];
        [parser parse];
        
        rootObject = [self xmlRootobject];
    }else if ([self jsonRootObject]){
        NSDictionary *d = [NSJSONSerialization JSONObjectWithData:container options:0 error:nil];
        [[self jsonRootObject] readFromJSONDictionary:d];
        
        rootObject = [self jsonRootObject];
    }
    if ([self completionBlock]) 
        [self completionBlock](rootObject, nil);
    
    [sharedConnectionList removeObject:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if ([self completionBlock]) 
        [self completionBlock](nil, error);
    
        [sharedConnectionList removeObject:self];
}

@end
