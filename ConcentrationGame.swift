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

struct ConcentrationGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    
    var indexOfOneFaceUp: Int? {
        get {
            var faceUpCardIndices = [Int]()
            for index in cards.indices {
                if cards[index].isFaceUp {
                    faceUpCardIndices.append(index)
                }
            }
            if faceUpCardIndices.count == 1 {
                return faceUpCardIndices.first
            } else{
                return nil
            }
        }
        set {
            for index in cards.indices {
                
                cards[index].isFaceUp = index == newValue
                
            }
        }
    }
    
    // mark functions in a STRUCT with "mutating" to let system know that you are making changes to self
    mutating func chooseCard(card: Card) {
//        print("card chosen: \(card)")
        // passed in argument card is a value type, it is a COPY
        
        // find the card's index
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            
            if let potentialMatchIndex = indexOfOneFaceUp {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
            } else{
               
                indexOfOneFaceUp = chosenIndex
            }
        }
        
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


