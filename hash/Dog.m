//
//  Dog.m
//  hash
//
//  Created by desunire on 2017/6/23.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(instancetype)initDogWithName:(NSString *)name andAge:(NSString *)age{
    
    if (self=[super init]) {
        self.name=name;
        self.age=age;
    }
    return self;
}

-(NSUInteger)hash{
    
    //NSLog(@"hash excute - %@",self);
    return [self.name hash] ^ [self.age hash];
}

-(BOOL)isEqual:(id)object{
    
    
    
    if (self==object) {
        return true;
    }
    if ([object isKindOfClass:[self class]] == false) {
        return false;
    }
    
    Dog *dog=object;
    if ([self.name isEqualToString:dog.name]&&[self.age isEqualToString:dog.age]) {
        
        return true;
    }
    return false;
}

@end
