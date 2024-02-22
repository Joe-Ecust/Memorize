//
//  MemorizeGame.swift
//  Memorize
//
//  Created by 周家乐 on 2024/2/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    // MARK: - actions
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card: Equatable {
        static func == (lhs: Card, rhs: Card) -> Bool {
            return lhs.isFaceUp == rhs.isFaceUp &&
            lhs.isMatched == rhs.isMatched &&
            lhs.content == rhs.content
        }
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
    }
    
}
