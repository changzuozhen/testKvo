//
//  classb.m
//  testKvo
//
//  Created by ChangZuozhen on 13-12-30.
//  Copyright (c) 2013年 ChangZuozhen. All rights reserved.
//

#import "classb.h"
#import "classA.h"
@implementation classb
SYNTHESIZE_SINGLETON_FOR_CLASS(classb)
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([object isKindOfClass:[classA class]]) {
        NSLog(@"ChangzuozhenGmailAdded old : %@ new: %@ kind: %@",[change objectForKey:@"old"],[change objectForKey:@"new"],[change objectForKey:@"kind"]);
        //added by changzuozhen
    }
}
@end
