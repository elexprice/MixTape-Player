//
//  ELEXMixtapeSong.h
//  MixTape Player
//
//  Created by IE Mixes on 6/12/14.
//  Copyright (c) 2014 Apps By Elex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELEXMixtapeSong : NSObject

// Properties of a song
@property (strong, nonatomic) NSString *songTitle;
@property (strong, nonatomic) NSURL *songURL;

// Init Song with Song Title & URL
-(instancetype)initMixtapeWithSongTitle:(NSString *)title andURL:(NSURL *)url;

@end
