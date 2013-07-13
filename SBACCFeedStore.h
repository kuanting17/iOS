//
//  SBACCFreedStore.h
//  SBACC
//
//  Created by Kuanting Chen on 5/12/13.
//  Copyright (c) 2013 Kuanting Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSSChannel;

@interface SBACCFeedStore : NSObject

+ (SBACCFeedStore *)sharedStore;

//@property (nonatomic, strong) NSDate *topSongsCacheDate;

- (void)fetchTopSong:(int)count
      withCompletion:(void (^)(RSSChannel *obj, NSError *err))block;

- (void)fetchRSSFeedWithCompletion:(void (^)(RSSChannel *obj, NSError *err)) block;

@end
