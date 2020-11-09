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
    @State var isShowingTheme = false
    
    var body: some View {
        
        ZStack {
            VStack {
                HStack {
                    Text("Memorize!")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    ZStack {
                        Button("Theme") {
                            isShowingTheme.toggle()
                        }
                        .padding(.all, 10)
                        .sheet(isPresented: $isShowingTheme) {
                            ThemeView(viewModel: self.viewModel)
                        }
                    }
                    .background(viewModel.getColor)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    
                    
                }
                .padding()
                HStack {
                    Text("Score: \(viewModel.score)")
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text("\(viewModel.getThemeName)")
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .padding(.horizontal, 20)
                GridView(viewModel.cards) { card in
                    CardView(card: card).onTapGesture {
                        viewModel.choose(card: card)
                    }
                    .padding()
                }
                .foregroundColor(viewModel.getColor)
            }
            if viewModel.gameOver {
                GameOverView(viewModel: viewModel)
                    .padding()
            }
        }
    
    
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
