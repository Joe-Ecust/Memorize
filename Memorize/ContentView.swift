//
//  ContentView.swift
//  Memorize
//
//  Created by 周家乐 on 2024/2/21.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        HStack{
            CardView(isFaceUp: true);
            CardView();
            CardView();
            CardView();
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(
                cornerRadius: 12
            )
            var x = 1
            
            if(isFaceUp){
                base.fill(
                    .white
                )
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            print("tapped")
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
