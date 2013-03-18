//
//  ViewController7.m
//  WordPress
//
//  Created by Isaac Godfried on 3/2/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import "ViewController7.h"

@implementation ViewController7

- (void)viewDidLoad
{   
    [super viewDidLoad];
	[self formatString];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self loadProperView];
}
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{   [self loadProperView];
    
}
-(void)formatString
{   Teacher_Info*teacherInformation = [[Teacher_Info alloc] init];
    
    NSLog(@"NSString*string=\n%@", _teacherName);
    //Very reptititive code must be a better way of doing this. I was thinking of maybe searching the string and matching it to the function...But the problems is the string passed in doesn't exactly match the function (i.e. getinfoBulteel and Jim Bulteel).
    if ([_teacherName isEqualToString:@"Jim Bulteel"])
        {  [teacherInformation getInfoBulteel];
            NSArray*jim=teacherInformation.jimBulteel;
            [self loadTeacherData:jim];
        }
    else if ([_teacherName isEqualToString:@"Don Joseph"])
    {
        [teacherInformation getInfoJoseph];
        NSArray*joseph=teacherInformation.donJoseph;
        [self loadTeacherData:joseph];
    }
    else if ([_teacherName isEqualToString:@"Chris Luthin"])
    {
        [teacherInformation getInfoLuthin];
        NSArray*luthin=teacherInformation.chrisLuthin;
        [self loadTeacherData:luthin];
        
    }
    else if ([_teacherName isEqualToString:@"Claire Moriarty"])
    {
        [teacherInformation getinfoMoriarty];
        NSArray*moriarty=teacherInformation.claireMoriarty;
        [self loadTeacherData:moriarty];
        
    }
    else if ([_teacherName isEqualToString:@"Christine Crocker"])
    {
        [teacherInformation getInfoCrocker];
        NSArray*teacher=teacherInformation.chrisCrocker;
        [self loadTeacherData:teacher];
        
    }


}
-(void)loadTeacherData:(NSArray *)teacherFinal
{
    self.teacherBio.text=[teacherFinal objectAtIndex:0];
    self.coursesTaught.text=[teacherFinal objectAtIndex:1];
    self.teacherPhone.text=[teacherFinal objectAtIndex:2];
    self.teacherEmail.text=[teacherFinal objectAtIndex:3];
}

-(void)loadProperView
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
       {
    UIDeviceOrientation interface = [[UIDevice currentDevice] orientation];
    if(((interface == UIInterfaceOrientationLandscapeLeft) ||
        (interface == UIInterfaceOrientationLandscapeRight))){
        CGRect rectText=CGRectMake(170, 30, self.teacherBio.frame.size.width-20, self.teacherBio.frame.size.height);
        _teacherBio.frame=rectText;
    }else if(((interface == UIInterfaceOrientationPortrait) ||
              (interface == UIInterfaceOrientationPortraitUpsideDown))){
        CGRect rectText=CGRectMake(0, 200, self.teacherBio.frame.size.width-20, self.teacherBio.frame.size.height);
        _teacherBio.frame=rectText;
    }
       }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_teacherEmail release];
    [_teacherBio release];
    [_teacherImage release];
    [_teacherPhone release];
    [_coursesTaught release];
    [super dealloc];
}
@end
