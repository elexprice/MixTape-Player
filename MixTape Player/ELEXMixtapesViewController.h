//
//  ELEXMixtapesViewController.h
//  MixTape Player
//
//  Created by IE Mixes on 6/4/14.
//  Copyright (c) 2014 Apps By Elex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELEXMixtapes.h"

@interface ELEXMixtapesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *topMixtape;
@property (weak, nonatomic) IBOutlet UIButton *leftBottomMixtape;
@property (weak, nonatomic) IBOutlet UIButton *rightBottomMixtape;

@property (weak, nonatomic) NSArray *mixtapes;

@end
