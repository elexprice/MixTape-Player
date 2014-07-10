//
//  ELEXAppDelegate.h
//  MixTape Player
//
//  Created by IE Mixes on 5/29/14.
//  Copyright (c) 2014 Apps By Elex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ELEXAppDelegate : UIResponder <UIApplicationDelegate, AVAudioPlayerDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
