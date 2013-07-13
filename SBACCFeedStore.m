//
//  SBACCFreedStore.m
//  SBACC
//
//  Created by Kuanting Chen on 5/12/13.
//  Copyright (c) 2013 Kuanting Chen. All rights reserved.
//

#import "SBACCFeedStore.h"
#import "RSSChannel.h"
#import "SBACCConnection.h"

@implementation SBACCFeedStore

//- (void)setTopSongsCacheDate:(NSDate *)topSongsCacheDate
//{
//    [[NSUserDefaults standardUserDefaults] setObject:topSongsCacheDate forKey:@"topSongsCacheDate"];
//}
//
//- (NSDate *)topSongsCacheDate
//{
//    return [[NSUserDefaults standardUserDefaults] objectForKey:@"topSongsCacheDate"];
//}

+ (SBACCFeedStore *)sharedStore
{
    static SBACCFeedStore *feedStore = nil;
    if (!feedStore) {
        feedStore = [[SBACCFeedStore alloc]init];
    }
    
    return feedStore;
}

- (void)fetchRSSFeedWithCompletion:(void (^)(RSSChannel *obj, NSError *err)) block
{
    NSURL *url = [NSURL URLWithString:@"http://southbayagape.org/index.php?view=category&id=12%3Anews-showcase-blurbs&option=com_content&Itemid=23&format=feed&type=rss"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    RSSChannel *channel = [[RSSChannel alloc] init];
    SBACCConnection *connection = [[SBACCConnection alloc] initWithRequest:req];
    [connection setCompletionBlock:block];
    [connection setXmlRootobject:channel];
    [connection start];
}
- (void)fetchTopSong:(int)count
      withCompletion:(void (^)(RSSChannel *obj, NSError *err))block
{
//    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    cachePath = [cachePath stringByAppendingPathComponent:@"song.archive"];
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/us/rss/topsongs/limit=10/genre=22/json"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    RSSChannel *channel = [[RSSChannel alloc] init];
    SBACCConnection *connection = [[SBACCConnection alloc] initWithRequest:req];
    [connection setCompletionBlock:block];
//    [connection setCompletionBlock:^(RSSChannel *obj, NSError *err)  {
//        if (!err) {
//            [self setTopSongsCacheDate:[NSDate date]];
//            [NSKeyedArchiver archiveRootObject:obj toFile:cachePath];
//        }
//        
//        block(obj, err);
//    }];
    [connection setJsonRootObject:channel];
    
    [connection start];
}

@end
