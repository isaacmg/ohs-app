//
//  ViewController5.m
//  WordPress
//
//  Created by Isaac Godfried on 2/15/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import "ViewController5.h"

@interface ViewController5 ()

@end

@implementation ViewController5
@synthesize webViewE=_webViewE;
- (void)viewDidLoad
{
    NSString *httpSource =@"";
    
    NSURL *fullUrl = [NSURL URLWithString:httpSource];
    NSURLRequest *httpRequest = [NSURLRequest requestWithURL:fullUrl];
    [_webViewE loadRequest:httpRequest];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_webViewE release];
    [super dealloc];
}
@end
