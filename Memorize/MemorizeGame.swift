//
//  MemorizeGame.swift
//  Memorize
//
//  Created by nhatle on 5/23/20.
//  Copyright © 2020 VNG. All rights reserved.
//

import Foundation

struct MemorizeGame<CardContent> {
    var cards: [Card]
    
    mutating func chose(card: Card) {
        print("Chose card: \(card.content) id: \(card.id)")
        if let index = cards.firstIndex(where: { $0.id == card.id }) {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairOfCard: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairOfCard {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatch: Bool = false
        var content: CardContent
        var id: Int
    }
}
