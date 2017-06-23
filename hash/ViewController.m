//
//  ViewController.m
//  hash
//
//  Created by desunire on 2017/6/23.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"
#import "Cat.h"

@interface ViewController ()

@property(assign,nonatomic)NSInteger num;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self testHash];
    
    self.num=0;
    
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)testHash{
    
    NSMutableSet *test=[NSMutableSet set];
    NSLog(@"开始添加");
    for (long int i=0; i<100000000; i++) {
        if (i>99999000) {
            NSLog(@"%ld",i);
        }
        Dog *dog=[[Dog alloc] initDogWithName:@"jack" andAge:[NSString stringWithFormat:@"%ld",i]];
        //Cat *cat=[[Cat alloc] initCatWithName:@"Tom" andAge:[NSString stringWithFormat:@"%ld",i]];
        [test addObject:dog];
       // [test addObject:cat];
        //[test setObject:dog forKey:@"car"];
    }
    
    //搜索耗时
    Dog *dog=[[Dog alloc] initDogWithName:@"jack" andAge:@"77777"];
    
    
//    //方法一：使用系统时间
//    NSDate* tmpStartData = [NSDate date];
//    //You code here...
//    double deltaTime = [[NSDate date] timeIntervalSinceDate:tmpStartData];
//    NSLog(@">>>>>>>>>>cost time = %f ms", deltaTime*1000);
    
    
    CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    NSLog(@"hash+isEqual遍历");
    for (Dog *ddog in test) {
        self.num++;
        if ([ddog hash]==[dog hash]) {
            if ([ddog isEqual:dog]) {
                NSLog(@"%lu,,%ld",(unsigned long)[dog hash],self.num);
                break;
            }
        }
    }
    CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
    NSLog(@"hash+isEqual遍历耗时 %f ms", (end-start) *1000.0);
   
    
    CFAbsoluteTime start1 = CFAbsoluteTimeGetCurrent();
    self.num=0;
    NSLog(@"isEqual遍历");
    for (Dog *ddog in test) {
        self.num++;
        if ([ddog isEqual:dog]) {
            NSLog(@"%lu,,%ld",(unsigned long)[dog hash],self.num);
            break;
        }
    }
    CFAbsoluteTime end1 = CFAbsoluteTimeGetCurrent();
    NSLog(@"isEqual遍历耗时 %f ms", (end1-start1) *1000.0);
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
