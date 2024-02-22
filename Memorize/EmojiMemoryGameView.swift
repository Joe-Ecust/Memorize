//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by 周家乐 on 2024/2/21.
//

import SwiftUI
import SwiftData

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View { // some vs any 主要的区别在于编译阶段,对编译器来说,对象类型是否是确定的.
        VStack {
            ScrollView {
                cards
                    .animation(.linear, value: viewModel.cards)
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self){ index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }.foregroundColor(Color.orange)
    }
}

// MARK: Sub Views
struct CardView: View {
    var card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(
                cornerRadius: 12
            )
            
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
