//
//  ViewController.m
//  Orono High School App
//
//  Created by Isaac Godfried on 2/3/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import "ViewController.h"
#import "BlogRssParser.h"
#import "BlogRss.h"
#import "RssFunAppDelegate.h"
#import "ViewController1.h"
#import "ISO8601DateFormatter.h"
@implementation ViewController
@synthesize rssParser = _rssParser;
@synthesize wordpresstableView =_tableView;
@synthesize upcomingView=_upcomingView;
@synthesize appDelegate = _appDelegate;
@synthesize toolbar = _toolbar;
@synthesize url;
@synthesize feed;

@synthesize selectedRow; 

-(void)toolbarInit{
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                      target:self action:@selector(reloadRss)];
	refreshButton.enabled = NO;
	NSArray *items = [NSArray arrayWithObjects: refreshButton,  nil];
	[self.toolbar setItems:items animated:NO];
	[refreshButton release];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	[self toolbarInit];
    self.view.backgroundColor = [UIColor  colorWithPatternImage:[UIImage imageNamed:@"back.png"]];
	_rssParser = [[BlogRssParser alloc]init];
	self.rssParser.delegate = self;
	[[self rssParser]startProcess];                                 //GData Youtube  
    GDataServiceGoogleYouTube *service = [self youTubeService]; 
	NSString *uploadsID = kGDataYouTubeUserFeedIDUploads;
	NSURL *feedURL = [GDataServiceGoogleYouTube youTubeURLForUserID:@"oronoriot" userFeedID:uploadsID];
    [self internetCheck];
	[self LoadCalendarData];
    
	[service fetchFeedWithURL:feedURL
                     delegate:self
            didFinishSelector:@selector(request:finishedWithFeed:error:)];
    
}
-(BOOL)internetCheck
{
    NSError*error=nil;
    NSURL*googleURL= [NSURL URLWithString:@"http://www.google.com"];
    NSString*checkError=[NSString stringWithContentsOfURL:googleURL encoding:NSUTF8StringEncoding error:&error];
    return ( checkError != NULL ) ? YES : NO;
}
-(void)reloadRss{
	[self toggleToolBarButtons:NO];
	[[self rssParser]startProcess];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.upcomingView.rowHeight = 80;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}


-(void)toggleToolBarButtons:(BOOL)newState{
	NSArray *toolbarItems = self.toolbar.items;
	for (UIBarButtonItem *item in toolbarItems){
		item.enabled = newState;
	}
}

//Delegate method for blog parser will get fired when the process is completed
- (void)processCompleted{
	//reload the table view
	[self toggleToolBarButtons:YES];
	[[self wordpresstableView]reloadData];
    
}
- (void)request:(GDataServiceTicket *)ticket
finishedWithFeed:(GDataFeedBase *)aFeed
          error:(NSError *)error {
    
	self.feed = (GDataFeedYouTubeVideo *)aFeed;
    
	[self.youtubeTableView reloadData];
    
}


-(void)processHasErrors{
	//Might be due to Internet
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Connectivity" message:@"Unable to download data. Please check if you are connected to internet."
												   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
	[alert show];
	[alert release];
	[self toggleToolBarButtons:YES];
}
//UITableView Info
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
        NSArray *thumbnails = [[(GDataEntryYouTubeVideo *)entry mediaGroup] mediaThumbnails];
        
        cell.textLabel.text = title;
        cell.textLabel.numberOfLines = 2;
        cell.textLabel.font = [UIFont boldSystemFontOfSize:12];
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[[thumbnails objectAtIndex:0] URLString]]];
        cell.imageView.image = [UIImage imageWithData:data];
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
        
        
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        NSLocale *locale = [NSLocale currentLocale];
        [dateFormat setLocale:locale];
        //[dateFormat setDateFormat:@"M/dd/yyyy"];
        [dateFormat setDateStyle:NSDateFormatterMediumStyle];
        
        cell.textLabel.numberOfLines = 2;
        cell.textLabel.text = [NSString stringWithFormat:@"%@", eventLcl.Title];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:12];
        cell.detailTextLabel.numberOfLines = 2;
        NSString *str1=[eventLcl.Description stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@" , str1];
        NSLog(@"NSString*str=\n%@",str1);
        
      
        
        [dateFormat release];
        return cell;
          }
}
//Calander Void Functions 

-(void)LoadCalendarData
{
      
    if([self internetCheck]==YES)
    {
    dispatch_sync(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL: kGoogleCalendarURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
        NSLog(@"Last Game");
    });
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Connectivity" message:@"Unable to download data. Please check if you are connected to internet."
                                                       delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    }
}


- (void)fetchedData:(NSData *)responseData {
    _EventArray = [[NSMutableArray alloc]init];
    
    //parse out the json data
    NSError* error;
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
        
        // Convert string to date object
        NSDateFormatter *dateFormat = [[[NSDateFormatter alloc] init]autorelease];
        NSLocale *enUSPOSIXLocale;
        enUSPOSIXLocale = [[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"] autorelease];
        [dateFormat setLocale:enUSPOSIXLocale];
        [dateFormat setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
        [dateFormat setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        
        //dates are stored in an array
        NSArray *dateArr = [event objectForKey:@"gd$when"];
        for(NSDictionary *dateDict in dateArr)
        {
            
            NSLocale *enUSPOSIXLocale;
            enUSPOSIXLocale = [[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"] autorelease];
            ISO8601DateFormatter *formatter = [[ISO8601DateFormatter alloc] init];
            
            NSDate *endDate = [formatter dateFromString:[dateDict objectForKey:@"endTime"]];
            NSDate *startDate = [formatter dateFromString:[dateDict objectForKey:@"startTime"]];
            [formatter release], formatter = nil;
            
            googCalObj.EndDate = endDate; //[endDate addTimeInterval:-3600*6];
            googCalObj.StartDate = startDate; //[startDate addTimeInterval:-3600*6];
            NSLog(@"Event: %@", [dateDict objectForKey:@"endTime"]);
            NSLog(@"Event: %@", googCalObj.EndDate);
            
        }
        
        
        NSDictionary *content = [event objectForKey:@"content"];
        googCalObj.Description = [content objectForKey:@"$t"];
        
        [_EventArray addObject:googCalObj];
        
        
    }
}
//End Void functions Calander
//Begin Action sheet
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        [self AddEventToCalendar];
    }
    NSLog(@"Button %d", selectedRow);
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
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];

    }
}
- (IBAction)refresh:(UIButton *)sender {
    [self viewDidLoad];
    [[self upcomingView]reloadData];

}
- (void)dealloc {
	[_appDelegate release];
	[_toolbar release];
	[_tableView release];
	[_rssParser release];
    [_youtubeTableView release];
    [_upcomingView release];
    [_refresh release];
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
	[_service setUserCredentialsWithUsername:nil
                                    password:nil];
	
	return _service;
}

@end
