//
//  ViewController.m
//  Orono High School App
//
//  Created by Isaac Godfried on 2/3/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize wordpresstableView =_tableView;
@synthesize url;
@synthesize feed;
@synthesize selectedRow; 
#pragma mark View Life Cycle  
- (void)viewDidLoad {
	[super viewDidLoad];
    self.view.backgroundColor = [UIColor  colorWithPatternImage:[UIImage imageNamed:@"back.png"]];
    [_refresh setBackgroundColor:[UIColor brownColor]];
    //RSS Feed 
	_rssParser = [[BlogRssParser alloc]init];
	self.rssParser.delegate = self;
	[[self rssParser]startProcess];
    //GData Youtube
    GDataServiceGoogleYouTube *service = [self youTubeService]; 
	NSString *uploadsID = kGDataYouTubeUserFeedIDUploads;
	NSURL *feedURL = [GDataServiceGoogleYouTube youTubeURLForUserID:@"oronoriot" userFeedID:uploadsID];
    [self internetCheck];
	[self LoadCalendarData];
	[service fetchFeedWithURL:feedURL delegate:self didFinishSelector:@selector(request:finishedWithFeed:error:)];
    if([self internetCheck]){
        _weatherInfo = [[NSMutableData alloc] init];
        NSURL*calanderUrl=[NSURL  URLWithString:@"http://api.wunderground.com/api/eae1e849db26ed92/conditions/q/ME/Orono.json"];
        _weatherInfo = [NSData dataWithContentsOfURL:calanderUrl];
        [self calanderDataReady];
        
    } else {
        NSLog(@"failed");
    }
}
-(void)viewWillLayoutSubviews
{    UIDeviceOrientation interface = [UIApplication sharedApplication].statusBarOrientation;
    if(((interface == UIInterfaceOrientationLandscapeLeft) ||
        (interface == UIInterfaceOrientationLandscapeRight))){
        [self landscapeLayout];
    }else if(((interface == UIInterfaceOrientationPortrait) ||
              (interface == UIInterfaceOrientationPortraitUpsideDown))){
        [self portraitLayout];
    }

}
-(void)viewWillDisappear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}

-(BOOL)internetCheck                   
{
    NSError*error=nil;
    NSURL*googleURL= [NSURL URLWithString:@"http://api.wunderground.com/api/eae1e849db26ed92/conditions/q/ME/Orono.json"];
    NSString*checkError=[NSString stringWithContentsOfURL:googleURL encoding:NSUTF8StringEncoding error:&error];
    return ( checkError != NULL ) ? YES : NO;
}
-(BOOL)internetCheck2
{
    NSError*error=nil;
    NSURL*googleURL= [NSURL URLWithString:@"http://google.com"];
    NSString*checkError=[NSString stringWithContentsOfURL:googleURL encoding:NSUTF8StringEncoding error:&error];
    return ( checkError != NULL ) ? YES : NO;
}
-(void)reloadRss{
	[[self rssParser]startProcess];
}
- (void)viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    [super viewWillAppear:animated];
   
    
        self.upcomingView.rowHeight = 80;
   

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}
-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
        //Just so your table is not at a random place in your view
        [self landscapeLayout];
    }else if(UIInterfaceOrientationIsPortrait(toInterfaceOrientation)){
        [self portraitLayout];
    }
    
}
-(void)landscapeLayout
{   if(UI_USER_INTERFACE_IDIOM() ==UIUserInterfaceIdiomPhone)
    {
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        if (screenSize.height>480)
        {
            _tableView.frame = CGRectMake(440,0,128,300);
            _youtubeTableView.frame=CGRectMake(311,0,128,300);
            _upcomingView.frame=CGRectMake(311,0,128,300);
        }
        else {
    _tableView.frame = CGRectMake(320,0,150,300);
    _youtubeTableView.frame=CGRectMake(160,134,150,165);
        _upcomingView.frame=CGRectMake(160,134,150,165);
        }
    CGRect high=CGRectMake(2, 230, _refresh.frame.size.width, _refresh.frame.size.height);
    [_refresh setFrame: high];
    _weatherImage.frame=CGRectMake(5, 15-5, _weatherImage.frame.size.width, _weatherImage.frame.size.height);
    _temperature.frame=CGRectMake(5, 48, _temperature.frame.size.width, _temperature.frame.size.height);
    _weatherCondition.frame=CGRectMake(5, 59, _weatherCondition.frame.size.width, _weatherCondition.frame.size.height);
        //CGRect switchbutton=CGRectMake(100, 159, 61, 33);
        CGRect switchbutton2=CGRectMake(100,230,61,33);
        [_switchView setFrame:switchbutton2];
        
        
    }
    else
    {   
        _youtubeTableView.frame=CGRectMake(730, 100, 290,520);
        _upcomingView.frame=CGRectMake(493,100, _upcomingView.frame.size.width,520);
        _tableView.frame=CGRectMake(10, 299, 350, 400-5);
        CGRect bell=CGRectMake(70, 230, 125, 50);
        [_bellSchedule setFrame:bell];
    }
}
-(void)portraitLayout
{   if(UI_USER_INTERFACE_IDIOM() ==UIUserInterfaceIdiomPhone)
    { int w=164;
    _upcomingView.hidden=YES;
       CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        if(screenSize.height>480)
        {
            _upcomingView.frame=CGRectMake(165,193,w,360);
            _tableView.frame=CGRectMake(0,193,w,360);
            _youtubeTableView.frame=CGRectMake(165,193,w,_tableView.frame.size.height);
            CGRect switchbutton=CGRectMake(259, 159, 61, 33);
            [_switchView setFrame:switchbutton];
        }
        else
        {
            _upcomingView.frame=CGRectMake(165,193,w,270);
            _tableView.frame=CGRectMake(0,193,w,270);
            _youtubeTableView.frame=CGRectMake(165,193,w,_tableView.frame.size.height);
            CGRect switchbutton=CGRectMake(259, 159, 61, 33);
            [_switchView setFrame:switchbutton];
        }
    
    _refresh.frame=CGRectMake(263,3,_refresh.frame.size.width,_refresh.frame.size.height);
    _youtubeTableView.hidden=NO;
    _weatherCondition.frame=CGRectMake(8,48, _weatherCondition.frame.size.width, _weatherCondition.frame.size.height);
    _temperature.frame=CGRectMake(8,63, _temperature.frame.size.width,_temperature.frame.size.height);
    _weatherImage.frame=CGRectMake(8,14,_weatherImage.frame.size.width,_weatherImage.frame.size.height);}
    else
    {
        _tableView.frame=CGRectMake(0,417,385,509);
         _youtubeTableView.frame=CGRectMake(385, 417, 385,509);
        _upcomingView.frame=CGRectMake(527,94,233,304);
        CGRect bell=CGRectMake(74, 300, 130, 61);
        [_bellSchedule setFrame:bell];
    }
    
}

//Delegate method for blog parser will get fired when the process is completed
- (void)processCompleted{
	//reload the table view
	[[self wordpresstableView]reloadData];
    
}
- (void)request:(GDataServiceTicket *)ticket
finishedWithFeed:(GDataFeedBase *)aFeed
          error:(NSError *)error {
    
	self.feed = (GDataFeedYouTubeVideo *)aFeed;
    if ([self internetCheck])
    {
    [self youtubeData];
        
	[self.youtubeTableView reloadData];
    }

    
}


-(void)processHasErrors{
	//Might be due to Internet
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Connectivity" message:@"Unable to download data. Please check if you are connected to internet."delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
	[alert show];
	[alert release];
}
-(void)youtubeData
{
    _youtubeThumbnails=[[NSMutableArray alloc]init];
   
    for (int y=0; y<12; y++){
        GDataEntryBase *entry = [[feed entries] objectAtIndex:y];
        NSArray *thumbnails = [[(GDataEntryYouTubeVideo *)entry mediaGroup] mediaThumbnails];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[[thumbnails objectAtIndex:0] URLString]]];
        [_youtubeThumbnails addObject:data];
    }

    
}
//UITableView Info
#pragma mark UITableView Data 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     if (tableView == self.wordpresstableView)
     {
	return [[[self rssParser]rssItems]count];
     }
    else if (tableView==self.youtubeTableView)
    {
        return [[feed entries] count];
    }
    else if (tableView==self.upcomingView)
    {
    return [_EventArray count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.wordpresstableView)
    {
	UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"rssItemCell"];
	if(nil == cell){
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"rssItemCell"]autorelease];
	}
	cell.textLabel.text = [[[[self rssParser]rssItems]objectAtIndex:indexPath.row]title];
    cell.textLabel.numberOfLines=2;
    cell.textLabel.font=[UIFont boldSystemFontOfSize:12];
  
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;}
    else if (tableView==self.youtubeTableView)
    {
        
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        }
        
        // Configure the cell.
        GDataEntryBase *entry = [[feed entries] objectAtIndex:indexPath.row];
        NSString *title = [[entry title] stringValue];
        
        cell.textLabel.text = title;
        cell.textLabel.numberOfLines = 2;
        cell.textLabel.font = [UIFont boldSystemFontOfSize:12];
        
        cell.imageView.image = [UIImage imageWithData:[_youtubeThumbnails objectAtIndex:indexPath.row]];
        return cell;
    }
    else if (tableView==self.upcomingView)
    {
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        }

        // Configure the cell...
        CalanderData *eventLcl = (CalanderData *)[_EventArray objectAtIndex:[indexPath row]];
        cell.textLabel.numberOfLines = 2;
        cell.textLabel.text = [NSString stringWithFormat:@"%@", eventLcl.Title];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:12];
        cell.detailTextLabel.numberOfLines = 2;
        NSString *str1=[eventLcl.Description stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@" , str1];
        NSLog(@"NSString*str=\n%@",str1);
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
//            [self dayInformation];
        });
        return cell;
          }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   if (tableView==self.wordpresstableView)
   {
    ViewController1*newview = [self.storyboard instantiateViewControllerWithIdentifier:@"pushedView"];
    url=[[[[self rssParser]rssItems]objectAtIndex:indexPath.row]linkUrl];
    NSLog(@"NSString *string = \n%@", url);
    newview.passedString =url;
    [self.navigationController pushViewController:newview animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   }
    else if (tableView==self.youtubeTableView)
    {
        ViewController3*newyt = [self.storyboard instantiateViewControllerWithIdentifier:@"pushed2"];

        GDataEntryBase *entry2 = [[feed entries] objectAtIndex:indexPath.row];
        NSArray *contents = [[(GDataEntryYouTubeVideo *)entry2 mediaGroup] mediaContents];
        NSURL*s5=[NSURL URLWithString:[[contents objectAtIndex:0] URLString]];
        newyt.passedString2=s5; 
        
        [self.navigationController pushViewController:newyt animated:YES];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    }
    else if (tableView==self.upcomingView)
    {   NSString*calanderUrl=@"http://riversidersu.org/index.php?option=com_wrapper&view=wrapper&Itemid=222";
       
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:calanderUrl]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];

    }
}
#pragma mark Calendar Functions 
//Calander Functions 
-(void)LoadCalendarData
{
    
    if([self internetCheck]==YES)
    {
        dispatch_sync(kBgQueue, ^{
            NSData* data = [NSData dataWithContentsOfURL: kGoogleCalendarURL];
            [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
            NSLog(@"Last Game");});
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Connectivity" message:@"Unable to download data. Please check if you are connected to internet."delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    }
}


- (void)fetchedData:(NSData *)responseData {
    _EventArray = [[NSMutableArray alloc]init];
    
    //parse out the json data
    NSError* error;
    if([self internetCheck2]){
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData //1
                          
                          options:kNilOptions
                          error:&error];
    
    NSDictionary* latestLoans = [json objectForKey:@"feed"]; //2d
    NSArray* arrEvent = [latestLoans objectForKey:@"entry"];
    for (NSDictionary *event in arrEvent)
    {
        CalanderData *googCalObj = [[[CalanderData alloc]init]autorelease];
        
        NSDictionary *title = [event objectForKey:@"title"];
        googCalObj.Title = [title objectForKey:@"$t"];
        NSDictionary *content = [event objectForKey:@"content"];
        googCalObj.Description = [content objectForKey:@"$t"];
        
        [_EventArray addObject:googCalObj];
    }
        
        
    }
}

-(void)AddEventToCalendar
{
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    CalanderData *calEvent = [[[CalanderData alloc]init]autorelease];
    
    calEvent = [_EventArray objectAtIndex:selectedRow];
    EKEvent *event  = [EKEvent eventWithEventStore:eventStore];
    event.title     = calEvent.Title;
    
    event.startDate = calEvent.StartDate;
    event.endDate   = calEvent.EndDate;
    [event setNotes:calEvent.Description];
    //event.description = calEvent.description;
    
    [event setCalendar:[eventStore defaultCalendarForNewEvents]];
    NSError *err;
    [eventStore saveEvent:event span:EKSpanThisEvent error:&err];
    [[self upcomingView]reloadData];
    
}
//Date information save this for another version. 
//-(void)dayInformation
//{
//    
//    int f=0; 
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    NSDate*today=[NSDate date];
//    NSString*dateString=[formatter stringFromDate:today];
//    NSString*descriptString=@"Hi";
//   while (_color)
//   {
//    while([descriptString isEqualToString:@"Hi"] || [descriptString rangeOfString:dateString].location != NSNotFound)
//        {
//      CalanderData*day=[_EventArray objectAtIndex:f];
//        NSString*revised=[day.Description stringByReplacingOccurrencesOfString:@"When:" withString:@""];
//        NSString*revised2=[revised stringByReplacingOccurrencesOfString:@"<br />\n\n\n<br />Event Status: confirmed" withString:@""];
//        descriptString=revised2;
//        if ([day.Title isEqualToString:@"White Day"])
//        {
//            _color=day.Title;
//        }
//        else if ([day.Title isEqualToString:@"Maroon Day"])
//        {
//            _color=day.Title; 
//        }
//        f=f+1;
//        }
//   }
//    int daysCount=1; 
//    NSURL*calanderUrl=[dayInformation getDayInformation:daysCount];
//    dispatch_sync(kBgQueue, ^{
//        NSData* data = [NSData dataWithContentsOfURL: calanderUrl];
//        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
//        NSLog(@"Last Game");});
//        daysCount++; 
//    
//}

//End Void functions Calander
#pragma mark Weather

- (void)calanderDataReady
{
    NSError *myError = nil;
    if([self internetCheck])
    {
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:_weatherInfo options:NSJSONReadingMutableLeaves  error:&myError];
    NSArray *results =  [res objectForKey:@"current_observation"];
    NSString *cur = [results valueForKey:@"weather"];
    NSString *tmp = [results valueForKey:@"temperature_string"];
    NSString*imgUrl=[results valueForKey:@"icon_url"];
    NSLog(@"Current conditions: %@, %@", cur, tmp);
    NSURL*weatherIcon=[NSURL URLWithString:imgUrl];
    NSData * imageData = [NSData dataWithContentsOfURL:weatherIcon];
    UIImage * image = [UIImage imageWithData:imageData];
    _weatherImage.image=image;
    _weatherCondition.text=cur;
    _temperature.text=tmp;
    }
}

- (IBAction)refresh:(UIButton *)sender {
    [self viewDidLoad];
    [[self upcomingView]reloadData];

}
- (IBAction)bellschedulePress:(UIButton *)sender {
    ViewController8*information=[self.storyboard instantiateViewControllerWithIdentifier:@"newView"];
    information.colorString=_color;
    [self.navigationController pushViewController:information animated:YES];
   
}
- (IBAction)viewDifferent:(UIButton *)sender {
    if(_upcomingView.hidden==YES)
    {
        _youtubeTableView.hidden=YES;
        _upcomingView.hidden=NO;
    }
    else
    {
        _upcomingView.hidden=YES;
        _youtubeTableView.hidden=NO;
    }
}

- (void)dealloc {
	[_toolbar release];
	[_tableView release];
	[_rssParser release];
    [_youtubeTableView release];
    [_upcomingView release];
    [_refresh release];
    [_weatherCondition release];
    [_weatherImage release];
    [_temperature release];
    [_schedule release];
    [_bellSchedule release];
    [_switchView release];
    [super dealloc];
}
- (GDataServiceGoogleYouTube *)youTubeService {
	static GDataServiceGoogleYouTube* _service = nil;
	
	if (!_service) {
		_service = [[GDataServiceGoogleYouTube alloc] init];
		
		[_service setUserAgent:@"AppWhirl-UserApp-1.0"];
		[_service setServiceShouldFollowNextLinks:YES];
	}
	
	// fetch unauthenticated
	[_service setUserCredentialsWithUsername:nil password:nil];
	return _service;
}

@end
