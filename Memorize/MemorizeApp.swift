//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 周家乐 on 2024/2/21.
//

import SwiftUI
import SwiftData

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
