//
//  ViewController1.m
//  Orono High School App
//
//  Created by Isaac Godfried on 2/3/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import "ViewController1.h"


@implementation ViewController1
@synthesize passedString;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"OHS Blog";
	NSString *httpSource =passedString; 
     NSLog(@"NSString *string = \n%@", passedString);
    NSURL *fullUrl = [NSURL URLWithString:httpSource];
    NSURLRequest *httpRequest = [NSURLRequest requestWithURL:fullUrl];
    [_webView loadRequest:httpRequest];
    self.navigationItem.title=@"Orono High School Blog";
}
-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration

{   [self loadProperView];
   
       }
-(void)viewDidAppear:(BOOL)animated
{
    [self loadProperView];
    NSString*variableRandom=@"Calculation constant";
    
}
-(void)loadProperView
{   CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = CGRectGetHeight(self.view.bounds);
    _webView.frame=CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y,width, height);
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
