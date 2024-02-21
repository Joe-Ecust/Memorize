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
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack{
            if(isFaceUp){
                RoundedRectangle(
                    cornerRadius: 12
                ).foregroundColor(
                    .white
                )
                RoundedRectangle(
                    cornerRadius: 12
                ).strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(
                    cornerRadius: 12
                )
            }
        }
    }
}

#Preview {
    ContentView()
    
}
