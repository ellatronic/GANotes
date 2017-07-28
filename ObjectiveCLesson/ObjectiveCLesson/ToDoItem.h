//
//  ToDoItem.h
//  ObjectiveCLesson
//
//  Created by Ella on 4/19/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

    @property NSString *itemName;
    @property BOOL completed;
    @property (readonly) NSDate *creationDate;

    @end
