//
//  Card.swift
//  Concentration
//
//  Created by Jamie on 2018/6/4.
//  Copyright © 2018 Jamie. All rights reserved.
//

import Foundation

struct Card: Hashable {
    private var identifier: Int
    var isFaceUp = false
    var isMatched = false
    var hashValue: Int {
        return identifier
    }
    
    static var identifierFactory = 0
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}
