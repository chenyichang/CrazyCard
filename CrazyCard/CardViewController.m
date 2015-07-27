//
//  CardViewController.m
//  CrazyCard
//
//  Created by easonchen on 15/6/25.
//  Copyright (c) 2015年 ___FULLUSERNAME___. All rights reserved.
//

#import "CardViewController.h"
#import "CardMatchGame.h"
#import "Deck.h"

@interface CardViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnCollection;

@property (strong,nonatomic) CardMatchGame *game;

@end

@implementation CardViewController

- (Deck *)createDeck
{
    return nil;
}

@synthesize game=_game;

- (CardMatchGame *)game
{
    if (!_game) {
        _game=[[CardMatchGame alloc] initWithCardCount:[self.btnCollection count] usingDeck:[self createDeck]];
    }
    return _game;
}

- (void)reStart
{
    _game=[[CardMatchGame alloc] initWithCardCount:[self.btnCollection count] usingDeck:[self createDeck]];
}

- (IBAction)cardTouch:(id)sender
{
    //UIImage *img=[UIImage imageNamed:@"cardPositive.png"];
    //[sender setBackgroundImage:img forState:UIControlStateNormal];
    int chosenCardIndex=[self.btnCollection indexOfObject:sender];
    [self.game choosenCardAtIndex:chosenCardIndex];
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardBtn in self.btnCollection) {
        int chosenCardIndex=[self.btnCollection indexOfObject:cardBtn];
        Card *card=[self.game cardAtIndex:chosenCardIndex];
        [cardBtn setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardBtn setBackgroundImage:[self imageForCard:card] forState:UIControlStateNormal];
        cardBtn.enabled=!card.isMatched;
    }
    [self.scoreLabel setText:[NSString stringWithFormat:@"Score:%d",self.game.score]];
    
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen?card.contents:@"";
}

- (UIImage *)imageForCard:(Card *)card
{
    return card.isChosen?[UIImage imageNamed:@"cardPositive"]:[UIImage imageNamed:@"cardNegitive"];
}
- (IBAction)gameRestart:(UIButton *)sender {
    [self reStart];
    [self updateUI];
}

@end
