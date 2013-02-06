//
//  ViewController1.m
//  WordPress
//
//  Created by Isaac Godfried on 2/3/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import "ViewController1.h"
#import "BlogRss.h"
#import "BlogRssParser.h"
@interface ViewController1 ()

@end

@implementation ViewController1
@synthesize passedString; 
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSString *httpSource =passedString; 
     NSLog(@"NSString *string = \n%@", passedString);
    NSURL *fullUrl = [NSURL URLWithString:httpSource];
    NSURLRequest *httpRequest = [NSURLRequest requestWithURL:fullUrl];
    [_webView loadRequest:httpRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_webView release];
    [super dealloc];
}
@end
