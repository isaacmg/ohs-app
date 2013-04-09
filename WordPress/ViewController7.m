//
//  ViewController7.m
//  WordPress
//
//  Created by Isaac Godfried on 3/2/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import "ViewController7.h"

@implementation ViewController7
#pragma mark View Life Cycle 
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
#pragma mark Getting Teacher Data
-(void)formatString
{   Teacher_Info*teacherInformation = [[Teacher_Info alloc] init];
    
    NSLog(@"NSString*string=\n%@", _teacherName);
    //Very reptititive code must be a better way of doing this. I was thinking of maybe searching the string and matching it to the function...But the problems is the string passed in doesn't exactly match the function (i.e. getinfoBulteel and Jim Bulteel) So it seems like you would have to write some type associative key anyways.
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
    else if ([_teacherName isEqualToString:@"Jessica Barnes"])
    {
        [teacherInformation getinfoBarnes];
        NSArray*teacher=teacherInformation.jessicaBarnes;
        [self loadTeacherData:teacher];
        
    }
    else if ([_teacherName isEqualToString:@"Waldo Cabellero"])
    {
        [teacherInformation getInfoCabellero];
        NSArray*teacher=teacherInformation.waldoCabellero;
        [self loadTeacherData:teacher];
        
    }
    else if ([_teacherName isEqualToString:@"Terry Henry"])
    {
        [teacherInformation getInfoHenry];
        NSArray*teacher=teacherInformation.terryHenry;
        [self loadTeacherData:teacher];
        
    }
    else if ([_teacherName isEqualToString:@"Steve Hogdon"])
    {
        [teacherInformation getInfoHogdon];
        NSArray*teacher=teacherInformation.steveHodgon;
        [self loadTeacherData:teacher];
        
    }
    else if ([_teacherName isEqualToString:@"Christine Crocker"])
    {
        [teacherInformation getInfoCrocker];
        NSArray*teacher=teacherInformation.chrisCrocker;
        [self loadTeacherData:teacher];
        
    }
    else if ([_teacherName isEqualToString:@"Jing Zhang"])
    {
        [teacherInformation getInfoZhang];
        NSArray*teacher=teacherInformation.jingZhang;
        [self loadTeacherData:teacher];
    }
    else if ([_teacherName isEqualToString:@"Jae Hubbard"])
    {
        [teacherInformation getInfoHubbard];
        NSArray*teacher=teacherInformation.jaeHubbard;
        [self loadTeacherData:teacher];
    }
    else if ([_teacherName isEqualToString:@"Heather Holmes"])
    {
        [teacherInformation getInfoHolmes];
        NSArray*teacher=teacherInformation.heatherHolmes;
        [self loadTeacherData:teacher];
    }
    else if ([_teacherName isEqualToString:@"Chris Libby"])
    {
        [teacherInformation getInfoLibby];
        NSArray*teacher=teacherInformation.chrisLibby;
        [self loadTeacherData:teacher];
    }
    else if ([_teacherName isEqualToString:@"Margie Innis"])
    {
        [teacherInformation getInfoInnis];
        NSArray*teacher=teacherInformation.margieInnis;
        [self loadTeacherData:teacher];
    }
    else if ([_teacherName isEqualToString:@"Richard Jelly"])
    {
        [teacherInformation getInfoJelly];
        NSArray*teacher=teacherInformation.dickJelly;
        [self loadTeacherData:teacher];
    }
    else if ([_teacherName isEqualToString:@"Chad Kirkpatrick"])
    {
        [teacherInformation getInfoKirpatrick];
        NSArray*teacher=teacherInformation.chadKirkpatrick;
        [self loadTeacherData:teacher];
    }
    else if ([_teacherName isEqualToString:@"Mike Archer"])
    {
        [teacherInformation getInfoArcher];
        NSArray*teacher=teacherInformation.mikeArcher;
        [self loadTeacherData:teacher];
    }

    else if ([_teacherName isEqualToString:@"Lesile Winchester"])
    {
        [teacherInformation getInfoWinchester];
        NSArray*teacher=teacherInformation.lesileWinchester;
        [self loadTeacherData:teacher];
    }
    else if ([_teacherName isEqualToString:@"Lesile Boyd"])
    {
        [teacherInformation getInfoBoyd];
        NSArray*teacher=teacherInformation.lesileBoyd;
        [self loadTeacherData:teacher];
    }
    else if ([_teacherName isEqualToString:@"Cynthania Clay"])
    {
        [teacherInformation getInfoClay];
        NSArray*teacher=teacherInformation.cynthaniaClay;
        [self loadTeacherData:teacher];
    }
    else if ([_teacherName isEqualToString:@"John Norris"])
    {
        [teacherInformation getInfoNorrisl];
        NSArray*teacher=teacherInformation.johnNorris;
        [self loadTeacherData:teacher];
    }
    else if ([_teacherName isEqualToString:@"Jeff Owen"])
    {
        [teacherInformation getInfoOwen];
        NSArray*teacher=teacherInformation.jeffOwen;
        [self loadTeacherData:teacher];
    }
    else if ([_teacherName isEqualToString:@"William Cowan"])
    {
        [teacherInformation getInfoCowan];
        NSArray*teacher=teacherInformation.williamCowan;
        [self loadTeacherData:teacher];
    }
    else if ([_teacherName isEqualToString:@"Shana Goodall"])
    {
        [teacherInformation getInfoGoodall];
        NSArray*teacher=teacherInformation.shanaGodall;
        [self loadTeacherData:teacher];
    }
    else if ([_teacherName isEqualToString:@"Dan Baker"])
    {
        [teacherInformation getInfoBaker];
        NSArray*teacher=teacherInformation.dBakes;
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
        CGRect rectText=CGRectMake(200, 30, self.teacherBio.frame.size.width-20, self.teacherBio.frame.size.height);
        _teacherBio.frame=rectText;
    }else if(((interface == UIInterfaceOrientationPortrait) ||
              (interface == UIInterfaceOrientationPortraitUpsideDown))){
        CGRect rectText=CGRectMake(0, 220, 320, 208);
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
