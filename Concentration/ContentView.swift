//
//  ContentView.swift
//  Concentration
//
//  Created by Rashmi Sharma on 8/15/20.
//  Copyright © 2020 Rashmi Sharma. All rights reserved.
//
/*
 Notes for self:
 
 stroke creates a border around shape
 Zstack: stacks items directly on top of one another
 can call functions on Zstack
    if not applicable to Zstack, will be applied to things inside Zstack
 
 ForEach:
    arguments: iteratable, content
    function: will iterate over the iteratable, and create that many content items
    iteratable:
        can be array, or range (eg. 0..<4)
        for range --> "index in", keeps track of iteration
 
 Hstack:
    arranges items horizontally
    can set the spacing --> HStack(spacing: __, content:)
 
 can remove explicit reference to "content" argument to clean up code
 */

import SwiftUI

struct ContentView: View {
    var emojiGame: EmojiConcentrationGame  //emojiGame is the viewModel
    
    var body: some View {
        return HStack {
            ForEach(emojiGame.cards)  { card in
                CardView(card: card).onTapGesture {
                    self.emojiGame.chooseCard(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: ConcentrationGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp  {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else{
                RoundedRectangle(cornerRadius: 10.0).fill() // back of card
            }
        }.aspectRatio(2/3, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojiGame: EmojiConcentrationGame())
    }
}
