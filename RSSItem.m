//
//  RSSItem.m
//  SBACC
//
//  Created by Kuanting Chen on 4/15/13.
//  Copyright (c) 2013 Kuanting Chen. All rights reserved.
//

#import "RSSItem.h"

@implementation RSSItem
@synthesize title, link, parentParserDelegate;

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqual:@"title"]) {
        currentString = [[NSMutableString alloc] init];
        [self setTitle:currentString];
    }else if ([elementName isEqual:@"link"]){
        currentString = [[NSMutableString alloc] init];
        [self setLink:currentString];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [currentString appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    currentString = nil;
    
    if ([elementName isEqual:@"item"]) {
        [parser setDelegate:parentParserDelegate];
    }
}

//- (void)encodeWithCoder:(NSCoder *)aCoder
//{
//    [aCoder encodeObject:title forKey:@"title"];
//    [aCoder encodeObject:link forKey:@"link"];
//}
//
//-(id)initWithCoder:(NSCoder *)aDecoder
//{
//    self = [super init];
//    if (self) {
//        [self setTitle:[aDecoder decodeObjectForKey:@"title"]];
//        [self setLink:[aDecoder decodeObjectForKey:@"link"]];
//    }
//    return self;
//}


-(void)readFromJSONDictionary:(NSDictionary *)d
{
    [self setTitle:[[d objectForKey:@"title"] objectForKey:@"label"]];
    NSArray *links = [d objectForKey:@"link"];
    if ([links count] > 1) {
        NSDictionary *sampleDict = [[ links objectAtIndex:1] objectForKey:@"attributes"];
        [self setLink:[sampleDict objectForKey:@"href"]];
    }
}

@end
