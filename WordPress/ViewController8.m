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
    [self setDayInfo];
}

- (void)viewDidLoad
{   self.advisory.hidden=YES;
    self.mini.hidden=YES;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration

{   [self loadProperView];
    
}
-(void)loadProperView
{   
    UIDeviceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if(UI_USER_INTERFACE_IDIOM() ==UIUserInterfaceIdiomPhone)
    {
        if(((orientation == UIInterfaceOrientationLandscapeLeft) ||
        (orientation == UIInterfaceOrientationLandscapeRight))){
        CGRect regular =CGRectMake(350, 20, _regularButton.frame.size.width, _regularButton.frame.size.height);
        CGRect advisory =CGRectMake(350, 80, _advisoryButton.frame.size.width, _advisoryButton.frame.size.height);
        CGRect mini =CGRectMake(350, 140, _miniDayButton.frame.size.width, _miniDayButton.frame.size.height);
        [_regularButton setFrame:regular];
        [_advisoryButton setFrame:advisory];
        [_miniDayButton setFrame:mini];}
        else //Portrait View 
        {
            CGRect regular =CGRectMake(5, 353, _regularButton.frame.size.width, _regularButton.frame.size.height);
            CGRect advisory =CGRectMake(109+3, 353, _advisoryButton.frame.size.width, _advisoryButton.frame.size.height);
            CGRect mini =CGRectMake(216, 353, _miniDayButton.frame.size.width, _miniDayButton.frame.size.height);
            [_regularButton setFrame:regular];
            [_advisoryButton setFrame:advisory];
            [_miniDayButton setFrame:mini];
        }
    
    }
    else if (UI_USER_INTERFACE_IDIOM() ==UIUserInterfaceIdiomPad)
    {
        if(((orientation == UIInterfaceOrientationLandscapeLeft) ||
            (orientation == UIInterfaceOrientationLandscapeRight))){
             _regularView.frame=CGRectMake(0, 0, 512, 384);
            _advisoryView.frame=CGRectMake(0, 384, 512, 384);
            _todayView.frame=CGRectMake(513, 0, 512, 384);
             _miniDay.frame=CGRectMake(513, 384, 512, 384);
        }
        else
        {
            _regularView.frame=CGRectMake(0, 0, 384, 512);
            _advisoryView.frame=CGRectMake(0, 512, 384, 512);
            _todayView.frame=CGRectMake(384, 0, 384, 512);
            _miniDay.frame=CGRectMake(384, 513, 384, 512);
            
        }
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
-(void)setDayInfo
{
    //NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //[formatter setDateStyle:NSDateFormatterMediumStyle];
    //NSDate*today=[NSDate date];
    //NSString*dateString= [formatter stringFromDate:today];
    //NSLog(@"NSString *string = \n%@", _colorString);
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
    [_dayColor release];
    [_regularView release];
    [_advisoryView release];
    [_todayView release];
    [_miniDay release];
    [super dealloc];
}
@end
