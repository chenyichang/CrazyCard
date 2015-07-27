//
//  Card.m
//  CrazyCard
//
//  Created by easonchen on 15/7/20.
//  Copyright (c) 2015年 easonchen. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score=0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score+=1;
        }
    }
    
    return score;
}

@end
