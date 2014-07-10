//
//  ELEXMixtapeSong.h
//  MixTape Player
//
//  Created by IE Mixes on 5/30/14.
//  Copyright (c) 2014 Apps By Elex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELEXMixtapes : NSObject



// properties of a mixtape
@property (strong, nonatomic) NSString *mixtapeTitle;
@property (strong, nonatomic) UIImage *mixtapeImage;
@property (strong, nonatomic) NSArray *mixtapeSongs;

// array of mixtapes
@property (strong, nonatomic) NSArray *mixtapes;

// designated initializer
-(instancetype)initMixtapeWithTitle:(NSString *)title andImage:(UIImage *)image andSongs:(NSArray *)songs;

// Class method to return array mixtapes
+(NSArray *)allMixtapes;


@end
