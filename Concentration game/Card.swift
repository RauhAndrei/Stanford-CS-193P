//
//  Card.swift
//  Concentration game
//
//  Created by Rauh Andrei on 12/2/20.
//  Copyright © 2020 Rauh Andrei. All rights reserved.
//

import Foundation
struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
   private static var identifireFactory = 0
    
   private static func getUniqueIdentifire() -> Int {
        identifireFactory += 1
        return Card.identifireFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifire()
    }
}
