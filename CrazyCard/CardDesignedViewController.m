//
//  CardDesignedViewController.m
//  CrazyCard
//
//  Created by easonchen on 15/7/30.
//  Copyright (c) 2015年 easonchen. All rights reserved.
//

#import "CardDesignedViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchGame.h"
#import "PlayingCardView.h"
#import "PlayingCard.h"

@interface CardDesignedViewController ()

@property (strong,nonatomic) CardMatchGame *game;

@property (strong, nonatomic) IBOutletCollection(PlayingCardView) NSArray *cardViewArray;

@property (weak, nonatomic) IBOutlet UILabel *lbScore;

@end

@implementation CardDesignedViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (CardMatchGame *)game
{
    if (!_game) {
        _game=[[CardMatchGame alloc] initWithCardCount:[self.cardViewArray count] usingDeck:[self createDeck]];
    }
    return _game;
}

- (IBAction)tapCard:(UITapGestureRecognizer *)sender {
    int indexOfchosen=[self.cardViewArray indexOfObject:sender.view];
    [self.game choosenCardAtIndex:indexOfchosen];
    [self updateUI];
}

- (void)updateUI
{
    for (int index=0; index<[self.cardViewArray count]; index++) {
        PlayingCard *card=(PlayingCard *)[self.game cardAtIndex:index];
        PlayingCardView *cardView= self.cardViewArray[index];
        cardView.rank=card.rank;
        cardView.suit=card.suit;
        cardView.faceUp=card.isChosen;
    }
    self.lbScore.text=[NSString stringWithFormat:@"score:%d",self.game.score];
}

- (IBAction)gameReStart:(UIButton *)sender {
    [self reStart];
    [self updateUI];
}

- (void)reStart
{
    _game=[[CardMatchGame alloc] initWithCardCount:[self.cardViewArray count] usingDeck:[self createDeck]];
}

@end
