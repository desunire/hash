//
//  Dog.h
//  hash
//
//  Created by desunire on 2017/6/23.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject

@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSString *age;

-(instancetype)initDogWithName:(NSString *)name andAge:(NSString *)age;

-(BOOL)isEqual:(id)object;

@end
