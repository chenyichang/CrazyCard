//
//  CardMatchGame.h
//  CrazyCard
//
//  Created by easonchen on 15/7/20.
//  Copyright (c) 2015年 easonchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchGame : NSObject

- (instancetype) initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck;

- (Card *)cardAtIndex:(NSInteger)index;

- (void)choosenCardAtIndex:(NSInteger)index;

@property (nonatomic,readonly) NSInteger score;

@end
