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
{   [self formatString];
    [super viewDidLoad];
	
}

-(void)viewWillLayoutSubviews
{
    [self loadProperView];
    
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self loadProperView];
}
#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self setImage];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}
- (void)setImage;
{
    UIImage*image=[UIImage imageWithData:_responseData];
    self.teacherImage.image=image;
}

#pragma mark Inserting Teacher Data
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
    else if([_teacherName isEqualToString:@"Christie Boyd"])
    {
        [teacherInformation getInfoCBoyd];
        NSArray*teacher=teacherInformation.christieBoyd;
        [self loadTeacherData:teacher];

    }
    else if ([_teacherName isEqualToString:@"Mackenzie Grobmyer"])
    {
        [teacherInformation getInfoGrobymyer];
        NSArray*teacher=teacherInformation.mGrobmyer;
        [self loadTeacherData:teacher];
        
    }
    else if ([_teacherName isEqualToString:@"Zachery Schiller"])
    {
        [teacherInformation getInfoSchiller];
        NSArray*teacher=teacherInformation.zackSchiller;
        [self loadTeacherData:teacher]; 
        
    }
    else if ([_teacherName isEqualToString:@"Jane Vanarsdale"])
    {
        [teacherInformation getInfoVanarsdale];
        NSArray*teacher=teacherInformation.janeVanarsdale;
        [self loadTeacherData:teacher]; 
    }
    else if ([_teacherName isEqualToString:@"Jim Chasse"])
    {
        [teacherInformation getInfoChasse];
        NSArray*teacher=teacherInformation.jimChasse;
        [self loadTeacherData:teacher];
    }
    else
    {
    
     _coursesTaught.text=@"None";
    _teacherBio.text=@"Administrator or teacher has not provided any biographical data.";
    _teacherPhone.text=@"Call the main office";
    _teacherEmail.text=@"Check website";
        
        
    }

}
-(void)loadTeacherData:(NSArray *)teacherFinal
{
    self.teacherBio.text=[teacherFinal objectAtIndex:0];
    self.coursesTaught.text=[teacherFinal objectAtIndex:1];
    self.teacherPhone.text=[teacherFinal objectAtIndex:2];
    self.teacherEmail.text=[teacherFinal objectAtIndex:3];
    NSString*path=[teacherFinal objectAtIndex:4];
    NSURL *url = [NSURL URLWithString:path];
    self.teacherNamed.text=_teacherName;
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // Create url connection and fire request
    NSURLConnection *conn = [[NSURLConnection alloc] init];
    (void)[conn initWithRequest:request delegate:self];

}
-(void)loadProperView
{   self.coursesTaught.lineBreakMode = NSLineBreakByWordWrapping;
    self.coursesTaught.numberOfLines = 2;
    self.teacherNamed.numberOfLines=2;
    self.teacherNamed.lineBreakMode =NSLineBreakByWordWrapping; 
    UIDeviceOrientation interface = [UIApplication sharedApplication].statusBarOrientation;
    if(UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone)
    {
    if(((interface ==UIInterfaceOrientationPortrait) ||(interface ==UIInterfaceOrientationPortraitUpsideDown))){
            [self portraitView];}
    else
    {
        [self landscapeView];
    }
}
    
}
-(void)portraitView
{
    CGSize screenView = [[UIScreen mainScreen]bounds].size;
    if (screenView.height>481)
    {
        _teacherImage.frame=CGRectMake(8, 8, 86, 115);
        _teacherPhone.frame=CGRectMake(161, 133, 139, 21);
        _teacherEmail.frame=CGRectMake(56, 150, 188, 21);
        _coursesTaught.frame=CGRectMake(8, 181, 312, 70);
        _teacherBio.frame=CGRectMake(0, 272, 320, 239);
        _bioStatic.frame=CGRectMake(96, 252, 129, 21);
        _phoneNumberStatic.frame=CGRectMake(8, 133, 149, 21);
        _emailStatic.frame=CGRectMake(8, 150, 129, 21);
         _coursesTaughtStatic.frame=CGRectMake(100, 165, 160, 20);
        self.coursesTaught.numberOfLines = 4;
    }
    else
    {
         _bioStatic.frame=CGRectMake(96, 210, 129, 21);
        _teacherBio.frame=CGRectMake(0, 230, 320, 200);
        _phoneNumberStatic.hidden=NO;
        _teacherEmail.frame=CGRectMake(56, 143, 188, 21);
        _emailStatic.frame=CGRectMake(8, 143, 129, 21);
        _teacherPhone.hidden=NO;
        _coursesTaughtStatic.frame=CGRectMake(100, 160, 160, 20);
        _coursesTaught.frame=CGRectMake(8, 180, 312, 37);
    }
}
-(void)landscapeView
{
    CGSize screenView = [[UIScreen mainScreen]bounds].size;
    if (screenView.height>481)
    {   
        _teacherBio.frame=CGRectMake(295, 1, 280, 279);
        _teacherPhone.frame=CGRectMake(161, 120, 139, 21);
        _teacherEmail.frame=CGRectMake(56, 140, 188, 21);
        _coursesTaught.frame=CGRectMake(8, 180, 280, 90);
        _bioStatic.frame=CGRectMake(96, 263, 129, 21);
        _phoneNumberStatic.frame=CGRectMake(8, 120, 150, 21);
        _emailStatic.frame=CGRectMake(8, 140, 129, 21);
        self.coursesTaught.numberOfLines = 5;
        _coursesTaughtStatic.frame=CGRectMake(60, 161, 160, 20);
        
    }
    else {
        _teacherBio.frame=CGRectMake(220, 90, 250, 190);
        _bioStatic.frame=CGRectMake(300, 70, 129, 21);
        _phoneNumberStatic.hidden=YES;
        _teacherPhone.hidden=YES;
        _teacherEmail.frame=CGRectMake(56, 189, 188, 21);
        _emailStatic.frame=CGRectMake(8, 189, 129, 21);
        _coursesTaught.frame=CGRectMake(8, 150, 200, 37);
        self.coursesTaught.numberOfLines = 3;
        _coursesTaughtStatic.frame=CGRectMake(60, 130, 160, 20);
        
        
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
    [_teacherName release];
    [_phoneNumberStatic release];
    [_emailStatic release];
    [_bioStatic release];
    [_coursesTaughtStatic release];
    [super dealloc];
}
@end
