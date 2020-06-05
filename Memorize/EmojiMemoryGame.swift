//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by nhatle on 5/23/20.
//  Copyright © 2020 VNG. All rights reserved.
//

import Foundation
class EmojiMemoryGame: ObservableObject {
    private var model: MemorizeGame<String> = createMemoryGame() {
        willSet {
            objectWillChange.send()
        }
    }
    
    static func createMemoryGame() -> MemorizeGame<String> {
        let emojis = ["🕷", "👻", "💀", "☠️", "🦟", "🦗", "🦂", "🐙"]
        return MemorizeGame<String>(numberOfPairOfCard: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    // MARK: Access to the model
    var cards: [MemorizeGame<String>.Card] {
        model.cards
    }
    
    // MARK: Intents:
    func chose(card: MemorizeGame<String>.Card) {
        model.chose(card: card)
    }
}
