//
//  ContentView.swift
//  Memorize
//
//  Created by nhatle on 5/23/20.
//  Copyright © 2020 VNG. All rights reserved.
//

import SwiftUI
import Combine

struct MemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        Grid(viewModel.cards) { (card) in
            CardView(card: card).onTapGesture {
                self.viewModel.chose(card: card)
            }
        .padding(5)
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemorizeGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: 10.0).fill()
                }
            }
        }
        .font(Font.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(viewModel: EmojiMemoryGame())
    }
}
