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
    @IBOutlet weak var flipedLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipedCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedStringKey: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1),
            ]
        
        let attributedString = NSAttributedString(string: "Filps:\(flipedCount)", attributes: attributes)
        flipedLabel.attributedText = attributedString
    }
    
    // private var emojiChoices = ["🍎", "👻", "👿", "🎃", "🦇", "🍭", "🍬", "😱", "💀"]
    private var emojiChoices = "🍎👻👿🎃🦇🍭🍬😱💀"
    
    var emoji = [Card: String]()
    
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
        if emoji[card] == nil, emojiChoices.count > 0 {
//            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            let randomIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomIndex))
        }
        return emoji[card] ?? "?"
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
        emojiChoices = "🍎👻👿🎃🦇🍭🍬😱💀"
        updateViewFromModel()
    }
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}

