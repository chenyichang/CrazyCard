//
//  PlayingCard.h
//  CrazyCard
//
//  Created by easonchen on 15/7/20.
//  Copyright (c) 2015年 easonchen. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;

@property (nonatomic) NSInteger rank;

+ (NSInteger)maxRank;

+ (NSArray *)validSuits;

+ (NSArray *)rankStrings;

@end
