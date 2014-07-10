//
//  ELEXMixtapesViewController.m
//  MixTape Player
//
//  Created by IE Mixes on 6/4/14.
//  Copyright (c) 2014 Apps By Elex. All rights reserved.
//

#import "ELEXMixtapesViewController.h"
#import "ELEXMixtapeViewController.h"
#import "ELEXMixtapes.h"

@interface ELEXMixtapesViewController ()

@end

@implementation ELEXMixtapesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _mixtapes = [ELEXMixtapes allMixtapes];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    ELEXMixtapes *tape = [self.mixtapes objectAtIndex:0];
    ELEXMixtapes *tape2 = [_mixtapes objectAtIndex:1];
    
    [_topMixtape setBackgroundImage: tape.mixtapeImage forState:UIControlStateNormal];
    [_leftBottomMixtape setBackgroundImage:tape2.mixtapeImage forState:UIControlStateNormal];
    
    
}



-(IBAction)pushToMixtapeView:(id)sender
{
    NSLog(@"pushtoMixtapeView:");
    
    ELEXMixtapeViewController *mixtapeView = [[ELEXMixtapeViewController alloc]init];
    
    if (sender == self.topMixtape) {
        //mixtapeView.mixtape = tape1;
        mixtapeView.tapeIndex = 0;
    } else if (sender == self.leftBottomMixtape) {
        //mixtapeView.mixtape = tape2;
        mixtapeView.tapeIndex = 1;
    } else if (sender == self.rightBottomMixtape) {
        return;
    }
    
    
    
    
    
    [self.navigationController pushViewController:mixtapeView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
