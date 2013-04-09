//
//  ViewController8.h
//  WordPress
//
//  Created by Isaac Godfried on 3/7/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h" 
#import "CalanderData.h" 
@interface ViewController8 : UIViewController
@property(nonatomic,retain)NSString*colorString;
@property (retain, nonatomic) IBOutlet UIView *regular;
@property (retain, nonatomic) IBOutlet UIView *advisory;
@property (retain, nonatomic) IBOutlet UIView *mini;
@property (retain, nonatomic) IBOutlet UIButton *regularButton;
@property (retain, nonatomic) IBOutlet UIButton *advisoryButton;
@property (retain, nonatomic) IBOutlet UIButton *miniDayButton;
@property (retain, nonatomic) IBOutlet UILabel *dayColor;
@property (retain, nonatomic) IBOutlet UIView *regularView;
@property (retain, nonatomic) IBOutlet UIView *advisoryView;
@property (retain, nonatomic) IBOutlet UIView *todayView;
@property (retain, nonatomic) IBOutlet UIView *miniDay;

@end
