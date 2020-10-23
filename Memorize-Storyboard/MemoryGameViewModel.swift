//
//  MemoryGameViewModel.swift
//  Memorize-Storyboard
//
//  Created by Pradyumn Shukla on 20/10/20.
//



import SwiftUI

/// View Model 
class MemoryGameViewModel {

    //Outside can see this variable, but only this class can set this variable
    private var MemoryGameModel: MemoryGame<String> = MemoryGameViewModel.createMemoryGame()
    
    static func createMemoryGame () -> MemoryGame<String> {
        let emojisArray: Array<String> =
            ["👻", "🎃", "🕷", "😴", "😱", "😡", "☠️", "👀", "🐶", "🔥", "🥳", "🤬", "🥶", "🐼", "🌎", "🍓", "🍿"].shuffled()
        let emojiCount = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairsOfCards: emojiCount) { pairIndex in
            return emojisArray[pairIndex]
        }
    }

    
    
    // MARK: - Getters
    
    var cards: Array<MemoryGame<String>.Card> {
         return MemoryGameModel.cards
    }
    
    // MARK: - Intent(s)
    
    func choose (card: MemoryGame<String>.Card) {
        MemoryGameModel.chooseCard(card: card)
    }
}
