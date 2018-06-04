//
//  Card.swift
//  Concentration
//
//  Created by Jamie on 2018/6/4.
//  Copyright © 2018 Jamie. All rights reserved.
//

import Foundation

struct Card {
    var identifier: Int
    var isFaceUp = false
    var isMatched = false
    
    static var identifierFactory = 0
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
}
