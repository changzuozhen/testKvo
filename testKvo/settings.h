//
//  settings.h
//  testKvo
//
//  Created by ChangZuozhen on 14-1-7.
//  Copyright (c) 2014年 ChangZuozhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARCSingletonTemplate.h"
@interface settings : NSObject
SYNTHESIZE_SINGLETON_FOR_HEADER(settings)
@property (nonatomic) NSMutableDictionary * playedCount;
-(void)savePersistentData:(id)sender;
-(void)loadPersistData:(id)sender;
@end
