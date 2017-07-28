//
//  ViewController.m
//  ObjectiveCLesson
//
//  Created by Ella on 4/19/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSArray *array = @[@"stringOne", @"stringTwo"];

    [array count];
    [array objectAtIndex:0];
    [array lastObject];
    [array objectEnumerator];
    [array indexOfObject:@"stringOne"];

    NSMutableArray *mutableArray = [NSMutableArray arrayWithObjects:@"stringOne", @"stringTwo", @"stringThree", @"stringFour", @"stringFive", @"stringSix", nil];

    [mutableArray removeObject:@"stringOne"];
    [mutableArray addObject:@"stringSeven"];
//    [mutableArray insertObject:@"stringEight" atIndex:8];

    NSDictionary *dictionary = @{
                                 @"key1":@"value1",
                                 @"key2":@"value2",
                                 @"key3":@"value3"
                                 };

    [dictionary valueForKey:@"key1"];

    NSMutableDictionary *mutableDictionary = [NSMutableDictionary alloc];
//    [mutableDictionary setValue:@"value1" forKey:@"key1"];

    NSLog(@"Hello World");

    NSString *string = @"string";
    NSLog(@"Hello World, give me a string %@", string);

    NSString *device = @"iPhone";
    int year = 2016;
    NSString *model = @"6";
    NSString *message = [NSString stringWithFormat:@" That's a %a %a from %d!, ", device, model, year];
    NSLog(@"%@", message);

    int i = 10;

    if (i == 10)  {
        NSLog(@"Hello, %d", i);
    }

    for (int i = 1; i <= [array count]; i++) {
        NSLog(@"I am iterating");
    }

    for (NSString *string in array) {
        NSLog(@"String: %@", string);
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
