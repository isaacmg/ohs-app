//
//  ViewController7.h
//  WordPress
//
//  Created by Isaac Godfried on 3/2/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Teacher Info.h"
@interface ViewController7 : UIViewController
@property (nonatomic,retain)NSString*teacherName;
@property (retain, nonatomic) IBOutlet UILabel *teacherEmail;
@property (retain, nonatomic) IBOutlet UITextView *teacherBio;
@property (retain, nonatomic) IBOutlet UIImageView *teacherImage;
@property (retain, nonatomic) IBOutlet UILabel *teacherPhone;
@property (retain, nonatomic) IBOutlet UILabel *coursesTaught;
@property (retain, nonatomic) IBOutlet UILabel *teacherNamed;
@end
