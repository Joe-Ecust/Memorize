//
//  ContentView.swift
//  Memorize
//
//  Created by 周家乐 on 2024/2/21.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let emojis: Array<String> = ["👻","🎃","😈","🕷️", "🌈", "🌹","🌧️","🏓","🚘","🚄","⛽️"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack{
            cards
            cardCountAdjusters
        }
        .foregroundColor(.orange)
        .padding()
    }
    
    var cards: some View{
        HStack{
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index]);
            }
        }
    }
    
    var cardCountAdjusters: some View {
        HStack{
            Button(action: {
                if(cardCount > 1){
                    cardCount -= 1
                }
            }, label: {
                Image(systemName: "rectangle.stack.badge.minus.fill")
            })
            Spacer()
            
            Button("Reset Card") {
                cardCount = 4
            }
            Spacer()
            Button("Add Card") {
                if(cardCount < emojis.count){
                    cardCount += 1
                }
            }
        }
        //            .imageScale(.large)
        //            .font(.largeTitle)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(
                cornerRadius: 12
            )
            
            if(isFaceUp){
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
