//
//  PlayingCardViewController.m
//  CrazyCard
//
//  Created by easonchen on 15/7/24.
//  Copyright (c) 2015年 easonchen. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"

@interface PlayingCardViewController ()

@end

@implementation PlayingCardViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (PlayingCardDeck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
