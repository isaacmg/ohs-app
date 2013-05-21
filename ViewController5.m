//
//  ViewController5.m
//  Orono High School App
//
//  Created by Isaac Godfried on 2/15/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import "ViewController5.h"

@implementation ViewController5
- (void)viewDidLoad
{   

}
-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{   [self loadProperView];
    
}

-(void)viewWillAppear:(BOOL)animated
{   _teacherData=[[NSMutableArray alloc]init];
    self.navigationItem.title=@"Staff Directory";
    //Teacher Data...a bit reptitive probably could find a more concise way but least technical.
    NSArray*administrative=[NSArray arrayWithObjects:@"Jim Chasse",@"Bob Sinclair",nil];
    NSDictionary*adminstrators=[NSDictionary dictionaryWithObject:administrative forKey:@"Staff Directory"];
    NSArray*englishTeachers=[NSArray arrayWithObjects:@"Jim Bulteel",@"Don Joseph",@"Chris Luthin", @"Claire Moriarty",nil];
    NSDictionary*englishStudies=[NSDictionary dictionaryWithObject:englishTeachers forKey:@"Staff Directory"];
    NSArray*fineArtsTeachers=[NSArray arrayWithObjects:@"Jessica Barnes",@"Waldo Cabellero",@"Terry Henry", @"Steve Hogdon",nil];
    NSDictionary*fineArtStudies=[NSDictionary dictionaryWithObject:fineArtsTeachers forKey:@"Staff Directory"];
    NSArray*guidance=[NSArray arrayWithObjects:@"Peter Buehner",@"Holly Gunn",nil];
    NSDictionary*guidancePeople=[NSDictionary dictionaryWithObject:guidance forKey:@"Staff Directory"];
    NSArray*foreignTeachers=[NSArray arrayWithObjects:@"Christine Crocker",@"Jae Hubbard",@"Jing Zhang", nil];
    NSDictionary*foreignStudies=[NSDictionary dictionaryWithObject:foreignTeachers forKey:@"Staff Directory"];
    NSArray*mathTeachers=[NSArray arrayWithObjects:@"Heather Holmes",@"Margie Innis",@"Richard Jelly",@"Chris Libby", nil];
    NSDictionary*math=[NSDictionary dictionaryWithObject:mathTeachers forKey:@"Staff Directory"];
    NSArray*gymTeachers=[NSArray arrayWithObjects:@"Mike Archer",@"Chad Kirkpatrick",@"Lesile Winchester",nil];
    NSDictionary*gym=[NSDictionary dictionaryWithObject:gymTeachers forKey:@"Staff Directory"];
    NSArray*socialTeachers=[NSArray arrayWithObjects:@"William Cowan",@"Dan Baker",@"Shana Goodall", nil];
    NSDictionary*socialStudies=[NSDictionary dictionaryWithObject:socialTeachers forKey:@"Staff Directory"];
    NSArray*scienceTeachers=[NSArray arrayWithObjects:@"Lesile Boyd",@"Cynthania Clay",@"Jeff Owen",@"John Norris", nil];
    NSDictionary*scienceStudies=[NSDictionary dictionaryWithObject:scienceTeachers forKey:@"Staff Directory"];
    NSArray*otherTeachers=[NSArray arrayWithObjects:@"Christie Boyd", @"Mackenzie Grobmyer",@"Zachery Schiller", @"Jane Vanarsdale", nil];
    NSDictionary*otherStudies=[NSDictionary dictionaryWithObject:otherTeachers forKey:@"Staff Directory"];
    //Add teacher data to the array
    [_teacherData addObject:adminstrators];
    [_teacherData addObject:englishStudies];
    [_teacherData addObject:fineArtStudies];
    [_teacherData addObject:guidancePeople];
    [_teacherData addObject:foreignStudies];
    [_teacherData addObject:math];
    [_teacherData addObject:gym];
    [_teacherData addObject:scienceStudies];
    [_teacherData addObject:socialStudies];
    [_teacherData addObject:otherStudies];
    [self loadProperView];
}
-(void)loadProperView
{   CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = CGRectGetHeight(self.view.bounds);
    _staffDirectory.frame=CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y,width, height);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [_teacherData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dictionary = [_teacherData objectAtIndex:section];
    NSArray *array = [dictionary objectForKey:@"Staff Directory"];
    return [array count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if(section == 0)
        return @"Administrative";
    else if(section==1)
        return @"English";
    else if (section==2)
        return @"Fine Arts";
    else if(section==3)
        return @"Gudiance";
    else if (section==4)
        return @"Language";
    else if (section==5)
        return @"Math";
    else if (section==6)
        return @"Physical Education";
    else if (section==7)
        return @"Science";
    else if (section==8)
        return @"Social Studies";
    else
        return @"Other";
        
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set the data for this cell:
    NSDictionary *dictionary = [_teacherData objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"Staff Directory"];
    NSString *cellValue = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    // set the accessory view:
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dictionary = [_teacherData objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"Staff Directory"];
    NSString *entry2 = [array objectAtIndex:indexPath.row];
    NSLog(@"NSString *string = \n%@",entry2);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
   {
    ViewController7 *aViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"teacherDetail"];
       aViewController.teacherName=entry2;
    UIPopoverController *popoverController = [[UIPopoverController alloc]initWithContentViewController:aViewController];
       popoverController.popoverContentSize = CGSizeMake(320, 416);
       UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
       CGRect rect=CGRectMake(cell.bounds.origin.x+600, cell.bounds.origin.y-190,320,416);
       [popoverController presentPopoverFromRect:rect inView:cell.contentView
                        permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];//Kegera
       }
    else if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
       {
           ViewController7 *aViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"teacherDetail"];
           aViewController.teacherName=entry2;
           [self.navigationController pushViewController:aViewController animated:YES];
       }
   
}
-(void)fillArray
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_staffDirectory release];
    [super dealloc];
}
@end
