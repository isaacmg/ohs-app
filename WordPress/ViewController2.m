//
//  ViewController2.m
//  Orono High School App
//
//  Created by Isaac Godfried on 2/5/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import "ViewController2.h"
@implementation ViewController2

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSString *httpSource =@"http://65.18.85.97:8080/Stu-Grd/index.jsp";
 
    NSURL *fullUrl = [NSURL URLWithString:httpSource];
    NSURLRequest *httpRequest = [NSURLRequest requestWithURL:fullUrl];
    [_webView1 loadRequest:httpRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{   [self loadProperView];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [self loadProperView];
}
-(void)loadProperView
{   CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = CGRectGetHeight(self.view.bounds);
    _webView1.frame=CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y,width, height);

}
- (void)dealloc {
    [_webView1 release];
    [super dealloc];
}
@end
