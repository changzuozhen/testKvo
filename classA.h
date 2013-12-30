//
//  classA.h
//  testKvo
//
//  Created by ChangZuozhen on 13-12-30.
//  Copyright (c) 2013年 ChangZuozhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARCSingletonTemplate.h"
@interface classA : NSObject
SYNTHESIZE_SINGLETON_FOR_HEADER(classA)

@property int aaa;
@end
