//
//  CalendarTableViewController.h
//  Election Map 2012
//
//  Created by Kurt Sparks on 2/1/12.
//  Copyright (c) 2012 none. All rights reserved.
//



#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1
#define kGoogleCalendarURL [NSURL URLWithString:  @"http://www.google.com/calendar/feeds/rsu26.org_m40mqhjvfp56rtjicvst6fc7qg%40group.calendar.google.com/public/basic/?alt=json&futureevents=true&orderby=starttime&sortorder=ascending&max-results=10&singleevents=true"]
#import <Foundation/NSJSONSerialization.h> 
#import <UIKit/UIKit.h>
#import "CalanderData.h"
#import <EventKit/EventKit.h>

@interface CalendarTableViewController : UIViewController<UIActionSheetDelegate>
{
     NSMutableArray *_EventArray;
     UIActionSheet *AddEventSheet;
     NSInteger selectedRow;
}

@property (nonatomic, retain) NSMutableArray *EventArray;
@property (nonatomic, assign) NSInteger selectedRow;

@property (retain, nonatomic) IBOutlet UITableView *upcomingViews;
-(void)LoadCalendarData;
-(void)AddEventToCalendar;
@end


