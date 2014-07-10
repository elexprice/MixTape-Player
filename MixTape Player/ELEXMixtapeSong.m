//
//  ELEXMixtapeSong.m
//  MixTape Player
//
//  Created by IE Mixes on 6/12/14.
//  Copyright (c) 2014 Apps By Elex. All rights reserved.
//

#import "ELEXMixtapeSong.h"

@implementation ELEXMixtapeSong

-(instancetype)initMixtapeWithSongTitle:(NSString *)title andURL:(NSURL *)url
{
    self = [super init];
    
    if (self) {
        _songTitle = title;
        _songURL = url;
    }
    
    return self;
}



@end
