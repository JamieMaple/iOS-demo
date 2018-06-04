//
//  ViewController.swift
//  Concentration
//
//  Created by Jamie on 2018/6/2.
//  Copyright © 2018 Jamie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var flipedLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipedCount = 0 {
        didSet {
            flipedLabel.text = "Fliped: \(flipedCount)"
        }
    }
    
    var emojiChoices = ["🍎", "👻", "👿", "🎃", "🦇", "🍭", "🍬", "😱", "💀"]
    
    var emoji = [Int: String]()
    
    // MARK: Methods
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    // MARK: Actions
    @IBAction func touchCard(_ sender: UIButton) {
        flipedCount += 1
        // flip card
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            fatalError("Error chosen card was not in cardButtons")
        }
        
    }
    
    @IBAction func newGame(_ sender: Any) {
        flipedCount = 0
        
        // reset model
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        emojiChoices = ["🍎", "👻", "👿", "🎃", "🦇", "🍭", "🍬", "😱", "💀"]
        updateViewFromModel()
    }
    
}

