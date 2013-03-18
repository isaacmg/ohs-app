//
//  Teacher Info.h
//  WordPress
//
//  Created by Isaac Godfried on 3/2/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher_Info : NSObject
@property (nonatomic,retain)NSMutableArray*jimBulteel;
@property (nonatomic, retain)NSMutableArray*donJoseph;
@property (nonatomic, retain)NSMutableArray*claireMoriarty;
@property (nonatomic, retain)NSMutableArray*chrisLuthin; 
@property (nonatomic, retain)NSMutableArray*williamCowan;
@property (nonatomic,retain)NSMutableArray*chrisCrocker;
@property (nonatomic, retain)NSMutableArray*jessicaBarnes;
@property (nonatomic, retain)NSMutableArray*waldoCabellero;
@property (nonatomic, retain)NSMutableArray*terryHenry;
@property (nonatomic, retain)NSMutableArray*hodgon;
-(void)getInfoBulteel;
-(void)getInfoJoseph;
-(void)getinfoMoriarty;
-(void)getInfoLuthin;
-(void)getInfoCrocker;
-(void)getInfoCowan;
-(void)getinfoBarnes;
-(void)getInfoCabellero;
-(void)getInfoHenry;
-(void)getInfoHogdon; 

@end
