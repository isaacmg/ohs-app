//
//  ViewController.h
//  WordPress
//
//  Created by Isaac Godfried on 2/3/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlogRssParser.h"
#import "ViewController1.h"

@class BlogRssParser;
@class BlogRss;
@class RssFunAppDelegate;

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,BlogRssParserDelegate> {
	BlogRssParser * _rssParser;
	UITableView * _tableView;
	RssFunAppDelegate * _appDelegate;
	UIToolbar * _toolbar;
}

@property (nonatomic,retain) IBOutlet BlogRssParser * rssParser;
@property (nonatomic,retain) IBOutlet UITableView * tableView;
@property (nonatomic,retain) IBOutlet UIToolbar * toolbar;
@property (nonatomic,retain) IBOutlet RssFunAppDelegate * appDelegate;
@property NSString*url;
-(void)toggleToolBarButtons:(BOOL)newState;
@end

