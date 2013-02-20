//
//  CalanderData.m
//  WordPress
//
//  Created by Isaac Godfried on 2/9/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import "CalanderData.h"

@implementation CalanderData
@synthesize Title;
@synthesize date;
@synthesize EndDate;
@synthesize StartDate; 
-(void)dealloc
{
    [Title release];
    [date release];
    [EndDate release];
    [StartDate release];
    
    [super dealloc];
}
@end
