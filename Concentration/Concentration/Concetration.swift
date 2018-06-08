//
//  Concetration.swift
//  Concentration
//
//  Created by Jamie on 2018/6/3.
//  Copyright © 2018 Jamie. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // Shuffle the cards
        shuffleCards()
    }
    
    func shuffleCards() {
        for i in cards.indices {
            let randomIndex = Int(arc4random_uniform(UInt32(Int(cards.count))))
            let temp = cards[i]
            cards[i] = cards[randomIndex]
            cards[randomIndex] = temp
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at:\(index)): chosen index not in the cards.")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
