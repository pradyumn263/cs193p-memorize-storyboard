//
//  MemoryGame.swift
//  Memorize-Storyboard
//
//  Created by Pradyumn Shukla on 20/10/20.
//

import Foundation

/// Model 
struct MemoryGame <CardContent> {
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>();
        
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, pairIndex: 2*pairIndex))
            cards.append(Card(content: content, pairIndex: 2*pairIndex+1))
        }
        cards.shuffle()
    }
    
    var cards: Array<Card>
    
    func chooseCard(card: Card) {
        print("Card Chosen! \(card)")
    }
    
    struct Card: Identifiable {
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
}


