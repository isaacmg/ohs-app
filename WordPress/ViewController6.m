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

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
	NSString *httpSource =@"http://riversidersu.org/index.php?option=com_content&view=article&id=121&Itemid=18";
    
    NSURL *fullUrl = [NSURL URLWithString:httpSource];
    NSURLRequest *httpRequest = [NSURLRequest requestWithURL:fullUrl];
    [_webView2 loadRequest:httpRequest];

}
-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration

{   [self loadProperView];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self loadProperView];
}
-(void)loadProperView
{   CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = CGRectGetHeight(self.view.bounds);
    _webView2.frame=CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y,width, height);
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
