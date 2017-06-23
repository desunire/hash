//
//  Cat.m
//  hash
//
//  Created by desunire on 2017/6/23.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "Cat.h"

@implementation Cat

-(instancetype)initCatWithName:(NSString *)name andAge:(NSString *)age{
    if (self=[super init]) {
        self.name=name;
        self.age=age;
    }
    return self;
}

@end
