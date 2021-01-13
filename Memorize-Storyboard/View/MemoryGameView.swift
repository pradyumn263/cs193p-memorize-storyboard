//
//  MemoryGameView.swift
//  Memorize-Storyboard
//
//  Created by Pradyumn Shukla on 30/09/20.
//

import SwiftUI

// MARK: - Main Game View
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
                            ThemeView(viewModel: viewModel)
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
                    .padding(5)
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
                PieView(startAngle: .degrees(0 - 90), endAngle: .degrees(110 - 90))
                    .padding(3)
                    .opacity(0.4)
                Text(card.content)
                    .font(.system(size: min(geometry.size.height, geometry.size.width) * fontScalingFactor))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 5
    let edgeLineWidth: CGFloat = 3
    let fontScalingFactor: CGFloat = 0.7
}



// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(viewModel: MemoryGameViewModel())
    }
}
