//
//  ELEXMixtapeViewController.h
//  MixTape Player
//
//  Created by IE Mixes on 5/29/14.
//  Copyright (c) 2014 Apps By Elex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MPMoviePlayerController.h>
#import "ELEXMixtapes.h"


@interface ELEXMixtapeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIView *mixtapePlayerView;
@property (strong, nonatomic) IBOutlet UIButton *playPauseToggleButton;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UILabel *songTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *songDurationLabel;
@property (strong, nonatomic) IBOutlet UILabel *songElaspedTimeLabel;
@property (strong, nonatomic) IBOutlet UITableView *songListTableView;
@property (strong, nonatomic) IBOutlet UIImageView *albumCoverImageView;
@property (strong, nonatomic) IBOutlet UIButton *prevSongButton;
@property (strong, nonatomic) IBOutlet UIButton *nextSongButton;

@property BOOL scrubbing;

@property (strong, nonatomic) ELEXMixtapes *mixtape;
@property (strong, nonatomic) NSArray *mixtapes;
@property (nonatomic) int tapeIndex;



@end

