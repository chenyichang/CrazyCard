//
//  PlayingCard.m
//  CrazyCard
//
//  Created by easonchen on 15/7/20.
//  Copyright (c) 2015年 easonchen. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *)contents
{
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

@synthesize suit=_suit;

- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit=suit;
    }
}

- (NSString *)suit
{
    return _suit?_suit:@"?";
}

+ (NSArray *)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];

}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSInteger)maxRank
{
    return [[PlayingCard rankStrings] count]-1;
}

- (NSInteger)match:(NSArray *)otherCards
{
    int score=0;
    
    if ([otherCards count]==1) {
        id card=[otherCards firstObject];
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard=(PlayingCard *)card;
            if ([otherCard.suit isEqualToString:self.suit]) {
                score=1;
            }
            else if(otherCard.rank==self.rank){
                score=4;
            }
        }
        
    }
    
    return score;
}

@end
