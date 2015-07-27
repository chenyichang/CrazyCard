//
//  CardMatchGame.m
//  CrazyCard
//
//  Created by easonchen on 15/7/20.
//  Copyright (c) 2015年 easonchen. All rights reserved.
//

#import "CardMatchGame.h"

@interface CardMatchGame()

@property (strong,nonatomic) NSMutableArray *cards;//of cards

@property (nonatomic,readwrite) NSInteger score;

@end

@implementation CardMatchGame

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards=[[NSMutableArray alloc] init];
    }
    return  _cards;
}

- (instancetype) initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck
{
    self=[super init];
    
    if (self) {
        for (int i=0; i<count; i++) {
            Card *card=[deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }
            else{
                self=nil;
                break;
            }
            
        }
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSInteger)index
{
    return index<[self.cards count]?self.cards[index]:nil;
}

static const int MISMATCH_PENALTY=2;
static const int MATCH_BONUS=4;
static const int COST_TO_CHOSE=1;

- (void)choosenCardAtIndex:(NSInteger)index
{
    Card *card=[self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen=NO;
        }
        else{
            for (Card *otherCard in self.cards) {
                if (!otherCard.isMatched && otherCard.isChosen) {
                    int matchScore=[card match:@[otherCard]];
                    if (matchScore) {
                        self.score+=matchScore*MATCH_BONUS;
                        card.matched=YES;
                        otherCard.matched=YES;
                    }
                    else{
                        self.score-=MISMATCH_PENALTY;
                        otherCard.chosen=NO;
                    }
                    break;
                }
            }
            card.chosen=YES;
            self.score-=COST_TO_CHOSE;
        }
    }
}

@end
