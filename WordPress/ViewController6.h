//
//  ViewController6.h
//  WordPress
//
//  Created by Isaac Godfried on 2/6/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController6 : UIViewController
@property (retain, nonatomic) IBOutlet UIWebView *webView2;
@property(nonatomic) BOOL scalesPageToFit;
@property(nonatomic,retain)IBOutlet UIBarButtonItem *back;
@property(nonatomic,retain)IBOutlet UIBarButtonItem *forward;
@property(nonatomic,retain)IBOutlet UIBarButtonItem *safari;

@property (retain, nonatomic) IBOutlet UIToolbar *navigationToolBar;

@end
