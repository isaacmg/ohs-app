//
//  ViewController3.m
//  Orono High School App
//
//  Created by Isaac Godfried on 2/5/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import "ViewController3.h"
@implementation ViewController3
@synthesize passedString2;
@synthesize webView=_webView;
-(void)viewDidDisappear:(BOOL)animated
{
    [_webView stopLoading];
}
- (void)viewWillAppear:(BOOL)animated
{
    
     self.webView.backgroundColor = [UIColor  colorWithPatternImage:[UIImage imageNamed:@"back.png"]];
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        CGRect frame = CGRectMake(90,200, 620,400);
        NSString *embedHTML =[self stringwork];
        UIWebView *videoView = [[UIWebView alloc] initWithFrame:frame];
        videoView.backgroundColor = [UIColor clearColor];
        [videoView loadHTMLString:embedHTML baseURL:nil];
        [self.view addSubview:videoView];

    }
    else
    {
        CGRect frame = CGRectMake(5,55, 249,200);
        NSString *embedHTML =[self stringwork];
        UIWebView *videoView = [[UIWebView alloc] initWithFrame:frame];
        videoView.backgroundColor = [UIColor clearColor];
        [videoView loadHTMLString:embedHTML baseURL:nil];
        [self.view addSubview:videoView];
    }
   
    

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(NSString *)stringwork                                 //Returns Youtube HTML Embed String 
{
    NSLog(@"NSURL*url = \n%@", passedString2);
    NSURL *fullUrl =passedString2;
    NSString *myString = [fullUrl absoluteString];
    NSLog(@"NSString*strt2 = \n%@", myString);
    NSString *str1=[myString stringByReplacingOccurrencesOfString:@"?version=3&f=user_uploads&app=youtube_gdata" withString:@""];
    NSString *str2=[str1 stringByReplacingOccurrencesOfString:@"https://www.youtube.com/v/" withString:@""];
    NSLog(@"NSString*string=\n%@", str2);
    NSString*yotubeRoot=@"http://www.youtube.com/embed/";
    NSString* combinedString1 = [yotubeRoot stringByAppendingString: str2];
    NSLog(@"NSString*string=\n%@", combinedString1);
    NSString *embed =[NSString stringWithFormat:@"<style type=\"text/css\">\
                      body {\
                      background-color: transparent;\
                      color: blue;\
                      }\
                      </style>\
                      </head><body style=\"margin:0\">\
                      <iframe height=\"200\" width=\"310\"src=\""
                      
                      ];
    NSString* combinedString2 = [embed stringByAppendingString: combinedString1];
    NSLog(@"NSString*string=\n%@", combinedString2);
    NSString*embed2 =[NSString stringWithFormat:@"\"></iframe>\
                      </body></html>"];
    NSString* combinedFinal = [combinedString2 stringByAppendingString: embed2];
    NSLog(@"NSString*string=\n%@", combinedFinal);
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
      NSString *finalString=[combinedFinal stringByReplacingOccurrencesOfString:@"<iframe height=\"200\" width=\"310\"" withString:@"<iframe height=\"400\" width=\"610\""];
        return finalString;
    }
    else return combinedFinal;

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
