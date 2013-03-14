//
//  ViewController.h
//  Orono High School App
//
//  Created by Isaac Godfried on 2/3/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1
#define kGoogleCalendarURL [NSURL URLWithString:  @"http://www.google.com/calendar/feeds/rsu26.org_m40mqhjvfp56rtjicvst6fc7qg%40group.calendar.google.com/public/basic/?alt=json&futureevents=true&orderby=starttime&sortorder=ascending&max-results=10&singleevents=true"]
#import <UIKit/UIKit.h>
#import "BlogRssParser.h"
#import "BlogRss.h"
#import "ViewController1.h"
#import "GData.h"
#import "ViewController3.h"
#import "ViewController2.h"
#import "CalanderData.h"
#import <Foundation/NSJSONSerialization.h>
#import <EventKit/EventKit.h>
#import "RssFunAppDelegate.h"

@class BlogRssParser;
@class BlogRss;

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,BlogRssParserDelegate> {
	BlogRssParser * _rssParser;
	UITableView * _tableView;
	RssFunAppDelegate * _appDelegate;
	UIToolbar * _toolbar;
    NSMutableArray*_EventArray;
    NSInteger selectedRow;
    UIActionSheet *AddEventSheet;
}

@property (nonatomic,retain) IBOutlet BlogRssParser * rssParser;
@property (nonatomic,retain) IBOutlet UITableView * wordpresstableView;
@property (retain, nonatomic) IBOutlet UITableView *youtubeTableView;
@property (retain, nonatomic) IBOutlet UITableView *upcomingView;
@property (retain, nonatomic) IBOutlet UIButton *refresh;
@property (assign) NSString*url;
@property (nonatomic, retain) GDataFeedYouTubeVideo *feed;
@property (nonatomic,retain)NSMutableArray*EventArray;
@property (nonatomic,assign)NSInteger selectedRow;
@property (retain, nonatomic) IBOutlet UILabel *weatherCondition;
@property (retain, nonatomic) IBOutlet UIImageView *weatherImage;
@property(nonatomic,retain) NSMutableData*weatherInfo;
@property (retain, nonatomic) IBOutlet UILabel *temperature;
-(void)LoadCalendarData;
-(void)AddEventToCalendar;
@end

