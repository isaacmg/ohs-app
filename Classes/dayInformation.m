//
//  dayInformation.m
//  WordPress
//
//  Created by Isaac Godfried on 3/26/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import "dayInformation.h"

@implementation dayInformation
+(NSURL *)getDayInformation
{
    NSString*googleCal=@"http://www.google.com/calendar/feeds/rsu26.org_m40mqhjvfp56rtjicvst6fc7qg%40group.calendar.google.com/public/basic/?alt=json&start-min=2013-01-01T10:57:00-08:00&orderby=starttime&sortorder=ascending&max-results=10&singleevents=true";
    NSURL*calanderData = [NSURL URLWithString:googleCal]; 
    return calanderData; 
 
}
//+(NSString *)dateString:(NSInteger)dayCount
//{   double secondCount=dayCount*(-86400);
//    NSDate *today = [NSDate date];
//    NSDate *properDate = [today dateByAddingTimeInterval: secondCount];
//    [self getDayInformation];
//
//}
@end
