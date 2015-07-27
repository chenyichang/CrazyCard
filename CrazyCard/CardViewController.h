//
//  CardViewController.h
//  CrazyCard
//
//  Created by easonchen on 15/6/25.
//  Copyright (c) 2015年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardViewController : UIViewController

//Must implement subClass
- (Deck *)createDeck;

@end
