//
//  Teacher Info.m
//  WordPress
//
//  Created by Isaac Godfried on 3/2/13.
//  Copyright (c) 2013 Isaac Godfried. All rights reserved.
//

#import "Teacher Info.h"

@implementation Teacher_Info
-(void)getInfoBulteel
{   _jimBulteel=[[NSMutableArray alloc]init];
    NSString*shortBio=@"Jim Bulteel has taught English at OHS for ten years. Prior to that he taught English and Drama to Dine (Navajo) students in New Mexico for nine years. He earned his Masters in Education from the University of Washington in Seattle, having arrived there from Sydney, Australia, where he taught history and multicultural for four years. He earned a BA from Oxford University, England in 1983.";
    NSString*coursesTaught=@"AP English , Bible as Literature, How to Argue, British Literature: Children's Classics";
    NSString*phoneNumber=@"207-866-4916-317";
    NSString*emailAddress=@"jbulteel@riversidersu.org";
    NSString*imageUrl=@"None at the moment";
    [_jimBulteel addObject:shortBio];
    [_jimBulteel addObject:coursesTaught];
    [_jimBulteel addObject:phoneNumber];
    [_jimBulteel addObject:emailAddress];
    [_jimBulteel addObject:imageUrl];
}
-(void)getInfoJoseph
{   _donJoseph=[[NSMutableArray alloc]init];
    NSString*shortBio=@"I graduated from Colby College with a double major (English and administrative science) and with a minor in history. I distinctly remember reading Daniel Defoe's Moll Flanders and discussing literature in this sophomore elective that I decided to be an English major. Upon graduating from Colby, I taught English at Brunswick High School and coached football and indoor and outdoor track. I have also taught in several other schools that have given me much experience and insight into teaching literaure and writing and working with students. I taught social studies and English in Kirkland, Washington, at Lake Washington School District; Morse High School in Bath, Maine; and also taught American studies and Engish at Lawrence High School in Fairfield, Me. For the past 10 years I have taught English and social studies, coached football and baseball, and served on numerous committees for the benefit of the Orono community.";
    NSString*coursesTaught=@"Short Fiction, Communication Skills, Expository Writing";
    NSString*phoneNumber=@"207-866-4916-317";
    NSString*emailAddress=@"djoseph@riversidersu.org";
    NSString*imageUrl=@"None at the moment";
    [_donJoseph addObject:shortBio];
    [_donJoseph addObject:coursesTaught];
    [_donJoseph addObject:phoneNumber];
    [_donJoseph addObject:emailAddress];
    [_donJoseph addObject:imageUrl];
}
-(void)getinfoMoriarty
{
    _claireMoriarty=[[NSMutableArray alloc]init];
    NSString*shortBio=@"Part of the joy, the thrill, that propels young people off to school is discovering, Oh, this is how other people conduct their lives. This is what other people do. This is how they think. For that reason, I believe that 'reading and writing should float on a sea of talk.' I do my best to foster classroom discussion that, however informal it might seem, goes somewhere. The idea is to provide students with models of good thinking, even instruction in the process of thinking, and certainly time to practice thinking through exchanges with others in class.I hold degrees in English and Microbiology and continue my apprenticeship in hockey.";
    NSString*coursesTaught=@"(AP English Language and Composition, Nonfiction, 20th Century Classics, Women and Literature, Introduction to Language and Literature,  Journalism, English 9, Expository Writing, Comparative Literature";
    NSString*phoneNumber=@"207-866-4916-318";
    NSString*emailAddress=@"cmoriarty@riversidersu.org";
    NSString*imageUrl=@"None at the moment";
    [_claireMoriarty addObject:shortBio];
    [_claireMoriarty addObject:coursesTaught];
    [_claireMoriarty addObject:phoneNumber];
    [_claireMoriarty addObject:emailAddress];
    [_claireMoriarty addObject:imageUrl];
}
-(void)getInfoLuthin
{
    
}
@end
