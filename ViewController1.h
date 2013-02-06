//
//  ViewController1.h
//  WordPress
//
//  Created by Isaac Godfried on 2/3/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//
#import "ViewController.h"
#import <UIKit/UIKit.h>
#import "BlogRssParser.h"
@interface ViewController1 : UIViewController
<UITableViewDataSource,UITableViewDelegate,BlogRssParserDelegate> {
	BlogRssParser * _rssParser;
	UITableView * _tableView;
	UIToolbar * _toolbar;
    NSString *passedString;
}

@property (retain, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSString  *passedString;

@end
