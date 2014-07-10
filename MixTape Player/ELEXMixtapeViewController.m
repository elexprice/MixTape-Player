//
//  ELEXMixtapeViewController.m
//  MixTape Player
//
//  Created by IE Mixes on 5/29/14.
//  Copyright (c) 2014 Apps By Elex. All rights reserved.
//

#import "ELEXMixtapeViewController.h"
#import "ELEXMixtapeSong.h"
#import <MediaPlayer/MPNowPlayingInfoCenter.h>
#import <MediaPlayer/MPMediaItem.h>
#import "ELEXMixtapes.h"

@interface ELEXMixtapeViewController ()

@property (strong, nonatomic) NSMutableArray *songList;
@property (strong, nonatomic) AVPlayer *audioPlayer;

@property (strong, nonatomic) AVPlayerItem *playerItem;


@property ( nonatomic) int songIndex;

@property MPMediaItemArtwork *albumArt;



@end

@implementation ELEXMixtapeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.mixtapePlayerView = [[UIView alloc]init];
        self.playPauseToggleButton = [[UIButton alloc]init];
        _slider = [[UISlider alloc]initWithFrame:CGRectMake(104, 49, 221, 31)];
        _songTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(108, 20, 208, 21)];
        _songDurationLabel = [[UILabel alloc]initWithFrame:CGRectMake(273, 87, 43, 21)];
        _songListTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 177, 320, 391) style:UITableViewStylePlain];
        _albumCoverImageView = [[UIImageView alloc]initWithFrame:CGRectMake(3, 20, 100, 100)];
        _songElaspedTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(108, 87, 43, 21)];
        _prevSongButton = [[UIButton alloc] initWithFrame:CGRectMake(89, 132, 37, 37)];
        _nextSongButton = [[UIButton alloc] initWithFrame:CGRectMake(194, 132, 37, 37)];
        
        
        
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Notification for when song has completed
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(seekToNextSong:) name:AVPlayerItemDidPlayToEndTimeNotification object:[self.audioPlayer currentItem]];
    
    
    if (self.audioPlayer.rate == 1.0) {
        [self.audioPlayer pause];
    } else {
    
    
    
    //1
    self.songListTableView.dataSource = self;
    self.songListTableView.delegate = self;
    
    //2
    self.audioPlayer = [[AVPlayer alloc]init];
    
    //NSArray *mixtapeSongs = [ELEXMixtapeSong mixtapeSongs];
    
    self.audioPlayer = [[AVPlayer alloc] init];
    
    //self.songList = [NSMutableArray arrayWithArray:self.mixtape.mixtapeSongs];
    ELEXMixtapeSong *song = [self.songList objectAtIndex:0];
    
    NSLog(@"%lu", (unsigned long)[self.songList indexOfObject:song]);
    
    self.songIndex = (int)[self.songList indexOfObject:song];
    
    //3
    [self.songListTableView reloadData];
    
    //4
    _playerItem = [AVPlayerItem playerItemWithURL: song.songURL];
    
    [self.audioPlayer replaceCurrentItemWithPlayerItem:self.playerItem];
    
    //5
    NSString *songTitle  = song.songTitle;
    self.songTitleLabel.text = songTitle;
    
    //6
    
    
    // mixtapePlayerView setup
    _mixtapePlayerView.frame = CGRectMake(0, 0, 320, 169);
    self.mixtapePlayerView.backgroundColor = [UIColor blackColor];
    
    
    // Play Button
    _playPauseToggleButton.frame = CGRectMake(143, 129, 36, 36);
    _playPauseToggleButton.selected = NO;
    [_playPauseToggleButton setBackgroundImage:[UIImage imageNamed:@"play_button"] forState:UIControlStateNormal];
    [_playPauseToggleButton addTarget:self action:@selector(togglePlayPausedTapped:) forControlEvents:UIControlEventTouchUpInside];
    [_mixtapePlayerView addSubview:_playPauseToggleButton];
    
    // PREV Button
    [_prevSongButton setTitle:@"PREV" forState:UIControlStateNormal];
    _prevSongButton.titleLabel.textColor = [UIColor whiteColor];
    _prevSongButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _prevSongButton.titleLabel.font = [UIFont boldSystemFontOfSize: 13];
    [_prevSongButton addTarget:self action:@selector(seekToPrevSong:) forControlEvents:UIControlEventTouchUpInside];
    [_mixtapePlayerView addSubview:_prevSongButton];
    
    // NEXT Button
    [_nextSongButton setTitle:@"NEXT" forState:UIControlStateNormal];
    _nextSongButton.titleLabel.textColor = [UIColor whiteColor];
    _nextSongButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _nextSongButton.titleLabel.font = [UIFont boldSystemFontOfSize: 13];
    [_nextSongButton addTarget:self action:@selector(seekToNextSong:) forControlEvents:UIControlEventTouchUpInside];
    [_mixtapePlayerView addSubview:_nextSongButton];
    
    // Slider
    [_slider addTarget:self action:@selector(configurePlayer:) forControlEvents:UIControlEventValueChanged];
    [_slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    
    [_mixtapePlayerView addSubview:_slider];
    
    // Song Title Label
    _songTitleLabel.text = songTitle;
    _songTitleLabel.textColor = [UIColor redColor];
    _songTitleLabel.textAlignment = NSTextAlignmentLeft;
    [_mixtapePlayerView addSubview:_songTitleLabel];
    
    // Song Duration Label
    _songDurationLabel.text = @"00:00";
    _songDurationLabel.textAlignment = NSTextAlignmentRight;
    _songDurationLabel.textColor = [UIColor blueColor];
    [_mixtapePlayerView addSubview:_songDurationLabel];
    
    // Song Elasped Time Label
    _songElaspedTimeLabel.text = @"00:00";
    _songElaspedTimeLabel.textAlignment = NSTextAlignmentRight;
    _songElaspedTimeLabel.textColor = [UIColor blueColor];
    [_mixtapePlayerView addSubview:_songElaspedTimeLabel];
    
    // Song List
    [self.view addSubview:_songListTableView];
    
    // Album Image
    //_albumCoverImageView.image = [UIImage imageNamed:@"hs most wanted.jpg"];
    [_mixtapePlayerView addSubview:_albumCoverImageView];
    
    [self.view addSubview:self.mixtapePlayerView];
    }
    
   // _albumArt = [[MPMediaItemArtwork alloc] initWithImage:self.albumCoverImageView.image];
    
    
}

-(IBAction)togglePlayPausedTapped:(id)sender
{
    if (self.playPauseToggleButton.selected) {
        [self.audioPlayer pause];
        [self.playPauseToggleButton setBackgroundImage:[UIImage imageNamed:@"play_button"] forState:UIControlStateNormal];
        [self.playPauseToggleButton setSelected:NO];
    } else {
        [self.audioPlayer play];
        [self.playPauseToggleButton setBackgroundImage:[UIImage imageNamed:@"pause_button"] forState:UIControlStateNormal];
        [self configurePlayer:self];
        
        [self.playPauseToggleButton setSelected:YES];
    }
    
}


-(IBAction)configurePlayer:(id)sender
{
    
    NSLog(@"configurePlayer: called");
    
    //7
    __block ELEXMixtapeViewController *weakSelf = self;
    
    
    //8
    [self.audioPlayer addPeriodicTimeObserverForInterval:CMTimeMakeWithSeconds(1, 1)
                                                   queue:NULL
                                              usingBlock:^(CMTime time) {
                                                  if(!time.value) {
                                                      return;
                                                  }
                                                  
                                                  int currentTime = (float)((weakSelf.audioPlayer.currentTime.value)/weakSelf.audioPlayer.currentTime.timescale);
                                                  int currentMins = (int)(currentTime/60);
                                                  int currentSec  = (int)(currentTime%60);
                                                  
                                                  NSString *elaspedLabel = [NSString stringWithFormat:@"%02d:%02d",currentMins,currentSec];
                                                 
                                                  weakSelf.songElaspedTimeLabel.text = elaspedLabel;
                                                  
                                                  weakSelf.slider.value = currentTime;
                                                  weakSelf.slider.minimumValue = 0;
                                                  [weakSelf.slider setMaximumValue:weakSelf.audioPlayer.currentItem.duration.value/weakSelf.audioPlayer.currentItem.duration.timescale];
                                                  
                                             
                                                  int durationMins = (CMTimeGetSeconds(weakSelf.audioPlayer.currentItem.duration)/60) - currentMins;
                                                  int durationSecs = CMTimeGetSeconds(weakSelf.audioPlayer.currentItem.duration) - currentSec;
                                                  
                                                  NSString *durationLabel =
                                                  [NSString stringWithFormat:@"%02d:%02d",durationMins,(durationSecs % 60)];
                                                  
                                                 
                                                  weakSelf.songDurationLabel.text = durationLabel;
                                                  
                                                  
                                                  
                                                  //NSArray *mixtapeSongs = [ELEXMixtapeSong mixtapeSongs];
                                                  
                                                  int curSongIndex = weakSelf.songIndex;
                                                  
                                                  ELEXMixtapeSong *curSong = [weakSelf.mixtape.mixtapeSongs objectAtIndex:curSongIndex];
                                                  
                                                  weakSelf.songIndex = curSongIndex;
                                                  
                                                  
                                                  NSString *songTitle = curSong.songTitle;
                                                  
                                                  weakSelf.songTitleLabel.text = songTitle;
                                                  
                                                  
                                                  
                                                  NSMutableDictionary *songInfo = [[NSMutableDictionary alloc]init];
                                                  [songInfo setObject:weakSelf.songTitleLabel.text forKey:MPMediaItemPropertyTitle];
                                                  [songInfo setObject:@"Hustle Squad" forKey:MPMediaItemPropertyAlbumTitle];
                                                  [songInfo setObject:@"Da Most Wanted" forKey:MPMediaItemPropertyArtist];
                                                  [songInfo setObject:weakSelf.albumArt forKey:MPMediaItemPropertyArtwork];
                                                  [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:songInfo];
                                                  
                                                  
    
                                                  
                                              }];
    
}

-(IBAction)sliderChanged:(id)sender
{
    [self.audioPlayer seekToTime:CMTimeMakeWithSeconds((int)(self.slider.value) , 1)];
}


-(IBAction)seekToNextSong:(id)sender
{
    
    if (self.songIndex == [self.songList count] - 1) {
        return;
    } else {
    
    NSLog(@"seekToNextSong: called");
    
    [self.audioPlayer pause];
    
   // NSArray *mixtapeSongs = [ELEXMixtapeSong mixtapeSongs];
   
    int curSongIndex = self.songIndex;
    NSLog(@"%i", curSongIndex);
    
    int nexSongIndex = curSongIndex + 1;
    NSLog(@"%i", nexSongIndex);

    ELEXMixtapeSong *nextSong = [self.mixtape.mixtapeSongs objectAtIndex:nexSongIndex];
    
    AVPlayerItem *nextSongItem = [AVPlayerItem playerItemWithURL:nextSong.songURL];
    
    [self.audioPlayer replaceCurrentItemWithPlayerItem:nextSongItem];
    
    self.songIndex = nexSongIndex;
    
    [self.audioPlayer play];
    
    NSString *songTitle = nextSong.songTitle;
    
    self.songTitleLabel.text = songTitle;
    [self.slider setMaximumValue:self.audioPlayer.currentItem.duration.value/self.audioPlayer.currentItem.duration.timescale];
        
    }
    

    
    
}


-(IBAction)seekToPrevSong:(id)sender
{
    NSLog(@"seekToPrevSong: called");
    
    if (self.songIndex == 0) {
        return;
    } else {
    
    [self.audioPlayer pause];
    
    //NSArray *mixtapeSongs = [ELEXMixtapeSong mixtapeSongs];
    
    int curSongIndex = self.songIndex;
    NSLog(@"%i", curSongIndex);
    
    int prevSongIndex = curSongIndex - 1;
    NSLog(@"%i", prevSongIndex);
    
    ELEXMixtapeSong *prevSong = [self.mixtape.mixtapeSongs objectAtIndex:prevSongIndex];
    
    AVPlayerItem *prevSongItem = [AVPlayerItem playerItemWithURL:prevSong.songURL];
    
    [self.audioPlayer replaceCurrentItemWithPlayerItem:prevSongItem];
    
    self.songIndex = prevSongIndex;
    
    [self.audioPlayer play];
    
    
    NSString *songTitle = prevSong.songTitle;
    
    self.songTitleLabel.text = songTitle;
    [self.slider setMaximumValue:self.audioPlayer.currentItem.duration.value/self.audioPlayer.currentItem.duration.timescale];
    }
}


// TableView delegate and datasource methods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MusicCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    ELEXMixtapeSong *song = [self.songList objectAtIndex:indexPath.row];
    
    NSString *songTitle = song.songTitle;
    
    cell.textLabel.text = songTitle;
  
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.audioPlayer pause];
    [self.playPauseToggleButton setBackgroundImage:[UIImage imageNamed:@"play_button"] forState:UIControlStateNormal];
    
    ELEXMixtapeSong *song = [self.songList objectAtIndex:indexPath.row];
    
    
    AVPlayerItem *curentItem = [AVPlayerItem playerItemWithURL:song.songURL];
    
    [self.audioPlayer replaceCurrentItemWithPlayerItem:curentItem];
    [self.audioPlayer play];
    [self.playPauseToggleButton setBackgroundImage:[UIImage imageNamed:@"pause_button"] forState:UIControlStateNormal];
    
    [self.playPauseToggleButton setSelected:YES];
    
    ELEXMixtapeSong *currentSong = [self.songList objectAtIndex:indexPath.row];
    NSString *songTitle = currentSong.songTitle;
    
    self.songTitleLabel.text = songTitle;
    [self.slider setMaximumValue:self.audioPlayer.currentItem.duration.value/self.audioPlayer.currentItem.duration.timescale];
    
    self.songIndex = (int)indexPath.row;
    
    [self configurePlayer:self];
    
    [self.songListTableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%lu", (unsigned long)[self.songList count]);
    
    return [self.songList count];
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Turn on Remote control event delivery
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    
    // Set itself as the first responder
    [self becomeFirstResponder];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    // Turn off remote control event delivery
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    
    // Resign as first responder
    [self resignFirstResponder];
    
    
    [super viewWillDisappear:animated];
    
    // "Save" changes to Player
    
    // Album cover, AVPlayerItem, AVPlayer, Slider
    
    
}

-(void)remoteControlReceivedWithEvent:(UIEvent *)recievedEvent
{
    if (recievedEvent.type == UIEventTypeRemoteControl) {
        
        switch (recievedEvent.subtype) {
            case UIEventSubtypeRemoteControlTogglePlayPause:
                [self togglePlayPausedTapped:nil];
                break;
                
            case UIEventSubtypeRemoteControlPreviousTrack:
                [self seekToPrevSong:nil];
                break;
                
            case UIEventSubtypeRemoteControlNextTrack:
                [self seekToNextSong:nil];
                break;
                
            default:
                break;
        }
    }
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.mixtapes = [ELEXMixtapes allMixtapes];
    self.mixtape = self.mixtapes[self.tapeIndex];
    
    
    //self.songList = tapes[self.tapeIndex];
   
    
    self.albumCoverImageView.image = self.mixtape.mixtapeImage;
    self.songList = [NSMutableArray arrayWithArray:self.mixtape.mixtapeSongs];

    
    _albumArt = [[MPMediaItemArtwork alloc] initWithImage:self.albumCoverImageView.image];
    
    [self.songListTableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
