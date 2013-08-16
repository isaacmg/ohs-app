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
    _webView2.scalesPageToFit=YES;
    
    
	NSString *httpSource =@"http://riversidersu.org/index.php?option=com_content&view=article&id=121&Itemid=18";
    
    NSURL *fullUrl = [NSURL URLWithString:httpSource];
    NSURLRequest *httpRequest = [NSURLRequest requestWithURL:fullUrl];
    [_webView2 loadRequest:httpRequest];

}
-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration

{   [self loadProperView];
    
}
-(IBAction)backButtonPressed:(id)sender{
    
	[_webView2 goBack];
    [sender setSelected:YES];}

//method for going forward in the webpage history
-(IBAction)forwardButtonPressed:(id)sender{
    [sender setSelected:YES];
	[_webView2 goForward];
}

-(IBAction)safriPressed:(id)sender
{
    NSString *currentURL =_webView2.request.URL.absoluteString;
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:currentURL]];
    [sender setSelected:YES];
}
- (IBAction)refreshPressed:(id)sender {
    [sender setSelected:YES];
    [_webView2 reload];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self loadProperView];
}
-(void)loadProperView
{   CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = CGRectGetHeight(self.view.bounds);
    _webView2.frame=CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y,width, height-30);
    _navigationToolBar.frame=CGRectMake(self.view.frame.origin.x,height-30,width, 30);
}

- (void)webViewDidStartLoad:(UIWebView *)thisWebView
{
	_back.enabled = NO;
	_forward.enabled = NO;
}

- (void)webViewDidFinishLoad:(UIWebView *)thisWebView
{
    
	//stop the activity indicator when done loading
    
    //canGoBack and canGoForward are properties which indicate if there is
    //any forward or backward history
	if(thisWebView.canGoBack == YES)
	{
		_back.enabled = YES;
		
	}
	if(thisWebView.canGoForward == YES)
	{
		_forward.enabled = YES;
		
	}
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_webView2 release];
    [_navigationToolBar release];
    [_back release];
    [_forward release];
    [_safari release];
    [super dealloc];
}
@end
