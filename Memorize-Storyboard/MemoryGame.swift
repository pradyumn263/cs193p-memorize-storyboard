//
//  MemoryGame.swift
//  Memorize-Storyboard
//
//  Created by Pradyumn Shukla on 20/10/20.
//

import Foundation

/// Model 
struct MemoryGame <CardContent> {
    
    // MARK: - Variables
    var cards: Array<Card>
    struct Card: Identifiable, Equatable {
        static func == (lhs: MemoryGame<CardContent>.Card, rhs: MemoryGame<CardContent>.Card) -> Bool {
            return lhs.id == rhs.id && lhs.isFaceUp == rhs.isFaceUp && lhs.isMatched == rhs.isMatched
        }
        
        init (content: CardContent, pairIndex: Int) {
            
            isFaceUp = true;
            isMatched = false;
            self.content = content
            id = pairIndex
        }
        
        var id: Int
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
    
    //MARK: - Initializer
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>();
        
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, pairIndex: 2*pairIndex))
            cards.append(Card(content: content, pairIndex: 2*pairIndex+1))
        }
        cards.shuffle()
        print("Model Init Finished")
        for card in cards {
            print("\(card.id) \(card.isFaceUp)")
        }
    }
    
    //MARK: - Methods
    /// This function "Chooses" a `card`
    /// Choosing a `card` means that's it's Face Up value is toggled
    ///
    /// The changes are made to the `cards` array in self
    /// - Parameter card: The `card` which you want to choose.
    mutating func chooseCard(card: Card) {
        print("Card Chosen! \(card)")
        // Instead of using firstIndex (which requires Card to be Equatable)
        // We can use the self made func called index(of: Card) -> Int?
        if let i = cards.firstIndex(of: card) {
            cards[i].isFaceUp = !cards[i].isFaceUp
            print("Card Flipped! \(cards[i])")
        }
    }
    
    /// This function finds the index of `card` present in the array `cards` present in self
    /// - Parameter card: The `card` which has to be searched
    /// - Returns: An optional Int, which is nil if the element is not found, otherwise it is the index of `card` in `cards`
    func index(of card: Card) -> Int? {
        for ind in 0..<cards.count {
            if(cards[ind].id == card.id) {
                return ind
            }
        }
        return nil // TODO: Return Optional?
    }
    
    
}


