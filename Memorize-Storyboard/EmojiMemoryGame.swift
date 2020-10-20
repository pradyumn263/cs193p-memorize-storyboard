//
//  EmojiMemoryGame.swift
//  Memorize-Storyboard
//
//  Created by Pradyumn Shukla on 20/10/20.
//

import SwiftUI

class EmojiMemoryGame {

    //Outside can see this variable, but only this class can set this variable
    private var MemoryGameModel: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame () -> MemoryGame<String> {
        let emojisArray: Array<String> = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojisArray.count) { pairIndex in
            return emojisArray[pairIndex]
        }
    }

    
    // MARK: - Getters
    
    var cards: Array<MemoryGame<String>.Card> {
        MemoryGameModel.cards
    }
    
    // MARK: - Intent(s)
    
    func choose (card: MemoryGame<String>.Card) {
        MemoryGameModel.chooseCard(card: card)
    }
}
