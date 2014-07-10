//
//  ELEXMixtapes.m
//  MixTape Player
//
//  Created by IE Mixes on 5/30/14.
//  Copyright (c) 2014 Apps By Elex. All rights reserved.
//

#import "ELEXMixtapes.h"
#import "ELEXMixtapeSong.h"

@implementation ELEXMixtapes

// designated initializer
-(instancetype)initMixtapeWithTitle:(NSString *)title andImage:(UIImage *)image andSongs:(NSArray *)songs
{
    self = [super init];
    
    if (self) {
        _mixtapeTitle = title;
        _mixtapeImage = image;
        _mixtapeSongs = songs;
        
    
    }
    
    return self;
}



+(NSArray *)allMixtapes
{
    
    
    // Hustle Squad - Da Most Wanted Mixtape
    
    // Title
    NSString *titleMostWanted = @"Da Most Wanted";
    
    
    // Mixtape Image
    UIImage *imageMostWanted = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/10250120_10151942420976106_8291164019259281697_n.jpg"]]];
    
    
    // Mixtape Song URLs
    ELEXMixtapeSong *song1 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Wat You Wanna Do" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/1.WAT-YOU-WANNA-DO.mp3"]];
    ELEXMixtapeSong *song2 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Hustle Squad Hustlas" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/2.HUSTLE-SQUAD-HUSTLAS.mp3"]];
    ELEXMixtapeSong *song3 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Shake It For Daddy" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/3.SHAKE-IT-4-DADDY-FT.-DAVID-BANNER-BUN-B.mp3"]];
    ELEXMixtapeSong *song4 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Still A Struggle" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/4.STILL-A-STRUGGLE.mp3"]];
    ELEXMixtapeSong *song5 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Northside" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/5.NORTHSIDE.mp3"]];
    ELEXMixtapeSong *song6 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Asking 4" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/6.ASKIN-4.mp3"]];
    ELEXMixtapeSong *song7 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"I'm Gone Do ME" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/7.IM-GONE-DO-ME.mp3"]];
    ELEXMixtapeSong *song8 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Antezy" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/8.ANTEZY.mp3"]];
    ELEXMixtapeSong *song9 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Dem Boys" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/9.DEM-BOYS.mp3"]];
    ELEXMixtapeSong *song10 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Say Jew" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/10.SAY-JEW-FT.-ROB-FAME-SUPA.mp3"]];
    ELEXMixtapeSong *song11 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Mean Dat" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/11.MEAN-DAT.mp3"]];
    ELEXMixtapeSong *song12 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Drop Dat" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/12.DROP-DAT-ASS-2.mp3"]];
    ELEXMixtapeSong *song13 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"That Thing You Do" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/13.THAT-THING-YOU-DO.mp3"]];
    ELEXMixtapeSong *song14 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Scream Dat" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/14.SCREAM-DAT.mp3"]];
    ELEXMixtapeSong *song15 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"H.S.G." andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/15.H.S.G..mp3"]];
    ELEXMixtapeSong *song16 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"High" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/16.HIGH_.mp3"]];
    ELEXMixtapeSong *song17 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Jacktown Ballers" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/17.JACKTOWN-BALLERS.mp3"]];
    ELEXMixtapeSong *song18 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Dat Hoe" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/04/18.DAT-HOE.mp3"]];
    
    // Add the songs to mixtape
    NSArray *songsMostWanted = [NSArray arrayWithObjects: song1, song2, song3, song4, song5, song6, song7, song8, song9, song10, song11, song12, song13, song14, song15, song16, song17, song18, nil];
    
    // Create Mixtape
    ELEXMixtapes *mixtapeMostWanted = [[ELEXMixtapes alloc]initMixtapeWithTitle:titleMostWanted andImage:imageMostWanted andSongs:songsMostWanted];
    
    // Lil C - Problem Child
    
    NSString *titleProblemChild = @"Problem Child";
    
    UIImage *imageProblemChild = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/01-Westside-Criminal-mp3-image.jpg"]]];
    
    // Song URLs
    ELEXMixtapeSong *pcSong1 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Westside Criminal" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/01-Westside-Criminal.mp3"]];
    ELEXMixtapeSong *pcSong2 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Pussy Don't Push Me" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/02-Pussy-Dont-Push-Me.mp3"]];
    ELEXMixtapeSong *pcSong3 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Fresher Than a Muthafucker" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/03-Fresher-Than-a-Muthafucker.mp3"]];
    ELEXMixtapeSong *pcSong4 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Who Wit It" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/04-Who-Wit-It.mp3"]];
    ELEXMixtapeSong *pcSong5 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Aight" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/05-Aight.mp3"]];
    ELEXMixtapeSong *pcSong6 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Crazy" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/06-Crazy.mp3"]];
    ELEXMixtapeSong *pcSong7 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Let Me In" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/07-Let-Me-In.mp3"]];
    ELEXMixtapeSong *pcSong8 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Fake Niggas" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/08-Fake-Niggas.mp3"]];
    ELEXMixtapeSong *pcSong9 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Ridin Wit Some Fools" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/09-Ridin-Wit-Some-Fools.mp3"]];
    ELEXMixtapeSong *pcSong10 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Hit Yo Corner" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/10-Hit-Yo-Corner.mp3"]];
    ELEXMixtapeSong *pcSong11 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"In Ya Mind" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/11-In-Ya-Mind.mp3"]];
    ELEXMixtapeSong *pcSong12 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Testimony" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/12-Testimony.mp3"]];
    ELEXMixtapeSong *pcSong13 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Trouble Man" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/13-Trouble-Man.mp3"]];
    ELEXMixtapeSong *pcSong14 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Stupid" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/14-Stupid.mp3"]];
    ELEXMixtapeSong *pcSong15 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Gettin It Right" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/15-Gettin-It-Right.mp3"]];
    ELEXMixtapeSong *pcSong16 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Me And You" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/16-Me-and-You.mp3"]];
    ELEXMixtapeSong *pcSong17 = [[ELEXMixtapeSong alloc] initMixtapeWithSongTitle:@"Crazy (Clean)" andURL:[NSURL URLWithString:@"http://iemixes.com/wp-content/uploads/2014/06/02-Crazy-Radio-Version.mp3"]];
    
    // add songs to mixtape
    NSArray *songsProblemChild = [NSArray arrayWithObjects: pcSong1, pcSong2, pcSong3, pcSong4, pcSong5, pcSong6, pcSong7, pcSong8, pcSong9,pcSong10, pcSong11, pcSong12, pcSong13, pcSong14, pcSong15, pcSong16, pcSong17, nil];
    
    // Create Problem Child Mixtape
    ELEXMixtapes *mixtapeProblemChild = [[ELEXMixtapes alloc]initMixtapeWithTitle:titleProblemChild
                                                                         andImage:imageProblemChild
                                                                         andSongs:songsProblemChild];
    
    // Create a list of mixtapes
    NSArray *mixtapeList = [NSArray arrayWithObjects: mixtapeProblemChild, mixtapeMostWanted, nil];
    
    
    // Return the mixtapes
    return mixtapeList;
}

@end
