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
    
    // mark functions in a STRUCT with "mutating" to let system know that you are making changes to self
    mutating func chooseCard(card: Card) {
        print("card chosen: \(card)")
        // passed in argument card is a value type, it is a COPY
        
        // find the card's index
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
        
        
        
    }
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0 // WHAT TO PUT HERE IF CARD NOT FOUND
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
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
        
    }
}


