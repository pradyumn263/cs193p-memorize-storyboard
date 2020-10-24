//
//  MemoryGameView.swift
//  Memorize-Storyboard
//
//  Created by Pradyumn Shukla on 30/09/20.
//

import SwiftUI

/// View
struct MemoryGameView: View {
    @ObservedObject var viewModel: MemoryGameViewModel
    
    var body: some View {
        GridView(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                viewModel.choose(card: card)
            }
            .aspectRatio(2/3, contentMode: .fit)
            .padding()
        }
//        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView : View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if(card.isFaceUp) {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
            .font(.system(size: min(geometry.size.height, geometry.size.width) * fontScalingFactor))
        }
    }
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    let fontScalingFactor: CGFloat = 0.75
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(viewModel: MemoryGameViewModel())
    }
}
