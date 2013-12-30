//
//  ARCSignletoneTemplate.h
//  SingletonTemplate
//
//  Created by KindAzrael on 12-12-6.
//  Copyright (c) 2012年 KindAzrael. All rights reserved.
//


#define SYNTHESIZE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;


#define SYNTHESIZE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
    static className *shared##className = nil; \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        shared##className = [[self alloc] init]; \
    }); \
    return shared##className; \
}

