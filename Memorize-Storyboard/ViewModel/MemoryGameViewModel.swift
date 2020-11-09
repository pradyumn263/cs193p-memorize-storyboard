//
//  MemoryGameViewModel.swift
//  Memorize-Storyboard
//
//  Created by Pradyumn Shukla on 20/10/20.
//



import SwiftUI

/// View Model 
class MemoryGameViewModel: ObservableObject {

    //Outside can see this variable, but only this class can set this variable
    @Published private var MemoryGameModel: MemoryGame<String> = MemoryGameViewModel.createMemoryGame()
    
    enum Theme {
        case animals
        case food
        case emojis
        case people
        case flags
    }
    
    static var currentTheme = Theme.animals
    static var currentThemeName: String {
        get {
            switch currentTheme {
            case .animals: return "Animals"
            case .emojis: return "Emojis"
            case .flags: return "Flags"
            case .food: return "Food"
            case .people: return "People"
            }
        }
    }
    static var currentColor: Color {
        get {
            switch currentTheme {
            case .animals: return Color.orange
            case .emojis: return Color.yellow
            case .flags: return Color.green
            case .food: return Color.red
            case .people: return Color.blue
            }
        }
    }
    
    static func createMemoryGame () -> MemoryGame<String> {
        let emojisArray: [String] = getEmojisArrayForCurrentTheme()
        let emojiCount = 9
        return MemoryGame<String>(numberOfPairsOfCards: emojiCount) { pairIndex in
            return emojisArray[pairIndex]
        }
    }

    
    
    // MARK: - Getters
    
    var cards: Array<MemoryGame<String>.Card> {
         return MemoryGameModel.cards
    }
    
    var score: Int {
        return MemoryGameModel.score
    }
    
    var gameOver: Bool {
        return MemoryGameModel.gameOver
    }
    
    var getColor: Color {
        return MemoryGameViewModel.currentColor
    }
    
    var getThemeName: String {
        return MemoryGameViewModel.currentThemeName
    }
    
    static func getEmojisArrayForCurrentTheme () -> [String] {
        switch currentTheme {
        case .animals: return ["🦊", "🐷", "🕷", "🐴", "🐝", "🦋", "🐞", "🦆", "🐶", "🐵", "🦇", "🦁", "🦄", "🦅", "🦖", "🐍", "🦑"].shuffled()
        case .emojis: return ["😁", "😇", "🤓", "😎", "🥰", "😂", "🥺", "🥶", "😡", "😱", "🤗", "🤯", "🥳", "🤩", "🤪", "🤢", "🤠"].shuffled()
        case .flags: return ["🇧🇷", "🇮🇳", "🇯🇴", "🇿🇦", "🇰🇷", "🇦🇪", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇺🇸", "🇵🇰", "🇳🇿", "🇯🇵", "🇳🇵", "🇬🇷", "🇦🇫", "🇺🇳", "🇧🇭", "🇦🇷"].shuffled()
        case .food: return ["🍐", "🍊", "🍎", "🍓", "🍑", "🍌", "🥭", "🍕", "🍔", "🥑", "🍆", "🌭", "🥨", "🍒", "🍩", "🍭", "🌮"].shuffled()
        case .people: return ["🙍🏻‍♂️", "💆🏻‍♂️", "💇🏻‍♂️", "👩🏻", "🤦🏻‍♀️", "👵🏻", "🥷🏻", "🏃🏻‍♂️", "🧑🏻‍🚀", "🧑🏻‍💻", "🧛🏻‍♀️", "💁🏻‍♀️", "🙆🏻‍♂️", "🏃🏻‍♀️", "🤷🏻‍♀️", "🙅🏻‍♂️", "🧟‍♂️"].shuffled()
        }
    }
    
    // MARK: - Intent(s)
    
    func choose (card: MemoryGame<String>.Card) {
        MemoryGameModel.chooseCard(card: card)
    }
    
    func setTheme (newTheme: MemoryGameViewModel.Theme) {
        MemoryGameViewModel.currentTheme = newTheme
        MemoryGameModel = MemoryGameViewModel.createMemoryGame()
    }
    
    func restartGame () {
        MemoryGameModel = MemoryGameViewModel.createMemoryGame()
    }
}
