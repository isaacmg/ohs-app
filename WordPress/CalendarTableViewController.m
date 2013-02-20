//
//  CalendarTableViewController.m
//  Election Map 2012
//
//  Created by Kurt Sparks on 2/1/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "CalendarTableViewController.h"
#import "ISO8601DateFormatter.h"


@implementation CalendarTableViewController
@synthesize EventArray = _EventArray;
@synthesize upcomingViews=_upcomingViews;
@synthesize selectedRow;



- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
    self.upcomingViews.rowHeight = 120;
   [self LoadCalendarData]; 
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
[self viewDidAppear:YES];
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==self.upcomingViews){
    // Return the number of rows in the section.
        return [_EventArray count];}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==self.upcomingViews){
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
    cell.font = [UIFont boldSystemFontOfSize:12];
    cell.detailTextLabel.numberOfLines = 2;
    
   
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@" , eventLcl.Description];
        NSLog(@"NSString*str=\n%@",eventLcl.Description);
    
    UIButton *button = [UIButton  buttonWithType:UIButtonTypeCustom];
    UIImage *buttonImage = [UIImage imageNamed:@"4848_calendar.png"];
    [button addTarget:self action:@selector(ShowEventAddSheet:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:buttonImage forState:UIControlStateHighlighted];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
    button.tag = [indexPath row];
    button.frame = CGRectMake(0.0, 0.0, 48, 48);
    
    cell.accessoryView = button;
    cell.accessoryType = UITableViewCellAccessoryNone;

    [dateFormat release];
        return cell; }
}

//Void functions 

-(void)LoadCalendarData
{
   
 
    dispatch_sync(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL: kGoogleCalendarURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    });

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



#pragma mark - Action Sheet delegate
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
    
}
//Large Comment Section
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
       [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)dealloc {
    [_upcomingViews release];
    [super dealloc];
}
@end
