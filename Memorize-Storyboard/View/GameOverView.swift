//
//  GameOverView.swift
//  Memorize-Storyboard
//
//  Created by Pradyumn Shukla on 09/11/20.
//

import SwiftUI

struct GameOverView: View {
    var viewModel: MemoryGameViewModel
    var body: some View {
      
            VStack (spacing: 10) {
                Text("Congratulations! You have won the game!")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Text("Your Score was \(viewModel.score)")
                    .font(.callout)
                    .fontWeight(.bold)
                ThemeButtonView(label: "New Game", currentColor: viewModel.getColor)
                    .scaleEffect(0.75)
                    .onTapGesture{
                        viewModel.restartGame()
                    }
                    .animation(.interactiveSpring())
                    
            }
            .padding(20)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .background(Color("bg"))
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(viewModel.getColor, lineWidth: 4)
            )
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
        
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var game = MemoryGameViewModel()
    static var previews: some View {
        GameOverView(viewModel: game)
    }
}
