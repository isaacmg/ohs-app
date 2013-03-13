//
//  ViewController8.m
//  WordPress
//
//  Created by Isaac Godfried on 3/7/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import "ViewController8.h"

@implementation ViewController8
-(void)viewWillAppear:(BOOL)animated
{
    [self loadProperView];
}

- (void)viewDidLoad
{   self.advisory.hidden=YES;
    self.mini.hidden=YES;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{   [self loadProperView];
    
}
-(void)loadProperView
{
    UIDeviceOrientation interface = [[UIDevice currentDevice]orientation];
    if(((interface == UIInterfaceOrientationLandscapeLeft) ||
        (interface == UIInterfaceOrientationLandscapeRight))){
        CGRect regular =CGRectMake(350, 20, _regularButton.frame.size.width, _regularButton.frame.size.height);
        CGRect advisory =CGRectMake(350, 80, _advisoryButton.frame.size.width, _advisoryButton.frame.size.height);
        CGRect mini =CGRectMake(350, 140, _miniDayButton.frame.size.width, _miniDayButton.frame.size.height);
        [_regularButton setFrame:regular];
        [_advisoryButton setFrame:advisory];
        [_miniDayButton setFrame:mini];
        
    }
}
- (IBAction)buttonRegular:(id)sender {
    self.advisory.hidden=YES;
    self.regular.hidden=NO;
    self.mini.hidden=YES;
}
- (IBAction)pushAdvisory:(id)sender {
    self.advisory.hidden=NO;
    self.regular.hidden=YES;
    self.mini.hidden=YES;
}
- (IBAction)miniPush:(id)sender {
    self.mini.hidden=NO;
    self.regular.hidden=YES;
    self.advisory.hidden=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_regular release];
    [_advisory release];
    [_regularButton release];
    [_advisoryButton release];
    [_miniDayButton release];
    [_mini release];
    [super dealloc];
}
@end
