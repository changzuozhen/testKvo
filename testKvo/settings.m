//
//  settings.m
//  testKvo
//
//  Created by ChangZuozhen on 14-1-7.
//  Copyright (c) 2014年 ChangZuozhen. All rights reserved.
//

#import "settings.h"

@implementation settings
SYNTHESIZE_SINGLETON_FOR_CLASS(settings)

@synthesize playedCount = _playedCount;
-(NSMutableDictionary *)playedCount{
    if(!_playedCount){
        _playedCount = [[NSMutableDictionary alloc] init];
    }
    return _playedCount;
}
-(void)savePersistentData:(id)sender{
    NSLog(@"savePersistentData");
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.playedCount forKey:@"playedCount"];
//    for (NSString * temp in [[settings sharedsettings].playedCount allKeys]) {
//        [userDefaults setInteger:[[[settings sharedsettings].playedCount valueForKey:temp] integerValue] forKey:temp];
//    }
    [userDefaults synchronize];
}
-(void)loadPersistData:(id)sender{
    NSLog(@"loadPersistData");
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.playedCount = [[userDefaults objectForKey:@"playedCount"] mutableCopy];
//    for (NSString * temp in [[settings sharedsettings].playedCount allKeys]) {
//        id temp2 = [userDefaults objectForKey:temp];
//        NSLog(@"%@",temp2);
//        [[settings sharedsettings].playedCount setObject:temp2 forKey:temp];
//    }

    
}
@end
