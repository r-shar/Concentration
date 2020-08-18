//
//  EmojiConcentrationGame.swift
//  Concentration
//
//  Created by Rashmi Sharma on 8/17/20.
//  Copyright © 2020 Rashmi Sharma. All rights reserved.
//
/*
 Notes:
 private: restricts all access to model to the class it appears in (no views can see the model!)
 private(set): views can now SEE the model, only the class can MODIFY the model
 OR
 use private and create vars/funcs that allow users to see the model in restricted ways
 
 
 
 static functions are applied to a CLASS, not a specific instance of an object
 */

// ViewModel 

import SwiftUI
// in-lined  this function below
//func createCardContent(pairIndex: Int) -> String {
//
//    return "🙈"
//}

class EmojiConcentrationGame {
    
    private var game: ConcentrationGame<String> = EmojiConcentrationGame.createConcentrationGame()
    
    static func createConcentrationGame() -> ConcentrationGame<String> {
        let emojis: Array<String> = ["🙈","🐮"]
        return ConcentrationGame<String>(numPairs: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
        
    
    // MARK - Access to the model
    var cards: Array<ConcentrationGame<String>.Card> {
        return game.cards
    }
    
    
    // MARK - Intent(s): allow views to request changes to be made by ViewModel to the model
    
    func chooseCard(card: ConcentrationGame<String>.Card) {
        game.chooseCard(card: card) // call model's function to choose card
    }
}
