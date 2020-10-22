//
//  ContentView.swift
//  Memorize-Storyboard
//
//  Created by Pradyumn Shukla on 30/09/20.
//

import SwiftUI

/// View
struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
                .aspectRatio(0.66, contentMode: .fit)
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(viewModel.cards.count > 8 ? .body : .largeTitle)
        
    }
}

struct CardView : View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if(card.isFaceUp) {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
