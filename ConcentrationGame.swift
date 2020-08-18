//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Rashmi Sharma on 8/17/20.
//  Copyright © 2020 Rashmi Sharma. All rights reserved.
//
/*
 Identifiable: is a protocol, must contain a var id:
 */
// Model 

import Foundation

struct ConcentrationGame<CardContent> {
    var cards: Array<Card>
    
    func chooseCard(card: Card) {
        print("card chosen: \(card)")
    }
    
    // tells us how to create a memory game
    // in this case, we use how many pairs to display
    init(numPairs: Int, contentFactory: (Int) -> CardContent) {
        cards = Array<Card>()  // creates empty array of cards
        
        for pairIndex in 0..<numPairs {
            let content = contentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1)) // append the matching pair
        }
        cards.shuffle()
    }
    struct Card: Identifiable {
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
        
    }
}


