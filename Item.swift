//
//  Item.swift
//  VideoResumeApp
//
//  Created by Madan Mohan Avulagadda on 13/04/25.
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
