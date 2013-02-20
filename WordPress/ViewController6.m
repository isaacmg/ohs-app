//
//  ViewController6.m
//  WordPress
//
//  Created by Isaac Godfried on 2/6/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import "ViewController6.h"

@interface ViewController6 ()

@end

@implementation ViewController6
@synthesize webView2=_webView2;
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
	// Do any additional setup after loading the view.
    
	NSString *httpSource =@"http://riversidersu.org/index.php?option=com_content&view=article&id=121&Itemid=18";
    
    NSURL *fullUrl = [NSURL URLWithString:httpSource];
    NSURLRequest *httpRequest = [NSURLRequest requestWithURL:fullUrl];
    [_webView2 loadRequest:httpRequest];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_webView2 release];
    [super dealloc];
}
@end
