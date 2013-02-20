//
//  CalanderData.h
//  WordPress
//
//  Created by Isaac Godfried on 2/9/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>

@interface CalanderData : NSObject
{
    NSString *Title;
    NSDate *date; 
}
@property (nonatomic,retain)NSString*Title;
@property (nonatomic,retain)NSDate*date;
@property (nonatomic, retain) NSDate *StartDate;
@property (nonatomic, retain) NSDate *EndDate;
@property (nonatomic, retain) NSString *Description;

@end
