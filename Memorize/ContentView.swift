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
    
    var body: some View { // some vs any 主要的区别在于编译阶段,对编译器来说,对象类型是否是确定的.
        VStack{
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View{
        HStack{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))], content: {
                ForEach(0..<cardCount, id: \.self){ index in
                    CardView(content: emojis[index])
                        .aspectRatio(2/3, contentMode: .fit)
                }
            })
        }
    }
    
    func cardCountAdjester(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardCountAdjusters: some View {
        HStack{
            cardCountAdjester(by: -1, symbol: "rectangle.stack.badge.minus.fill")
            Spacer()
            cardCountAdjester(by: 1, symbol: "rectangle.stack.badge.plus.fill")
        }
        .imageScale(.large)
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
            
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .foregroundColor(.orange)
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
