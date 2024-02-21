//
//  Item.swift
//  Memorize
//
//  Created by 周家乐 on 2024/2/21.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
