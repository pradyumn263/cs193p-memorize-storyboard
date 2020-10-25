//
//  MemoryGame.swift
//  Memorize-Storyboard
//
//  Created by Pradyumn Shukla on 20/10/20.
//

import Foundation

/// Model 
struct MemoryGame <CardContent> where CardContent: Equatable {
    
    // MARK: - Variables
    var cards: Array<Card>
    
    var score: Int = 0
    
    /// Gives the Index of the Only card which is faced up.
    /// If more than one cards are faced up, it is nil
    ///
    /// `set` sets the isFaceUp of call cards to `false`
    /// unless the card is already matched, or the index is equal to `newValue`
    var indexOfOnlyOneCardFaceUp: Int? {
        get { cards.indices.filter { !cards[$0].isMatched && cards[$0].isFaceUp }.onlyItem() }
        
        set {
            // Everything except itself, and already matched must be set to face down
            for index in cards.indices {
                if !cards[index].isMatched {
                    cards[index].isFaceUp = index == newValue
                }
            }
            
        }
    }
    
    struct Card: Identifiable, Equatable {
        static func == (lhs: MemoryGame<CardContent>.Card, rhs: MemoryGame<CardContent>.Card) -> Bool {
            return lhs.id == rhs.id && lhs.isFaceUp == rhs.isFaceUp && lhs.isMatched == rhs.isMatched
        }
        
        init (content: CardContent, pairIndex: Int) {
            
            isFaceUp = false;
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
    /// If 2 `card` are chosen already, it will see if they match.
    /// If they match, they will stay face up throughout the game. else, they will face down when
    /// a new card is chosen.
    /// `indexOfOnlyOneCardFaceUp` contains the index of the only card which is face up.
    /// If there are ore than 1 cards faced up, it is `nil`
    ///
    /// The changes are made to the `cards` array in self
    /// - Parameter card: The `card` which you want to choose.
    mutating func chooseCard(card: Card) {
        // Instead of using firstIndex (which requires Card to be Equatable)
        // We can use the self made func called index(of: Card) -> Int?
        if let chosenIndex = cards.firstIndex(of: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfOnlyOneCardFaceUp {
                print("First Card: \(cards[potentialMatchIndex])")
                print("Second Card: \(cards[chosenIndex])")
                cards[chosenIndex].isFaceUp = true
                if(cards[chosenIndex].content == cards[potentialMatchIndex].content) {
                    print("It is a Match!!")
                    score+=2
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                } else {
                    print("It's not a Match!")
                    score-=1
                }
            } else {
                indexOfOnlyOneCardFaceUp = chosenIndex
            }
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
        return nil
    }
    
}




