//
//  PlayingCardDeck.m
//  CrazyCard
//
//  Created by easonchen on 15/7/20.
//  Copyright (c) 2015年 easonchen. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init
{
    self=[super init];
    if (self) {
        for (NSString * suit in [PlayingCard validSuits]) {
            for (NSInteger rank=1; rank<=[PlayingCard maxRank]; rank++) {
                PlayingCard *card=[[PlayingCard alloc] init];
                card.suit=suit;
                card.rank=rank;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
