//
//  ViewController.swift
//  Concentration game
//
//  Created by Rauh Andrei on 12/2/20.
//  Copyright © 2020 Rauh Andrei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (numberOfPairsOfCards))
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count+1) / 2
    }
    
    //MARK: Creating and display score
    @IBOutlet weak var scoreLabel: UILabel!
    
    //MARK: Creating and display newGameButton.
    @IBAction func newGameButton(_ sender: UIButton) {
        flipCount = 0
        game.scoreNumber = 0
        emojiChoices += emojiArray.values
        emojiArray = [Int:String]()
        for i in game.cards.indices {
            game.cards[i].isFaceUp = false
            game.cards[i].isMatched = false
        }
        updateViewFromModel()
        chooseTheme()
    }
    
    //MARK: Creating and display number of flips
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    //MARK: Creating flips label
    @IBOutlet weak private var flipCountLabel: UILabel!
    
    var alreadyChoosenTheme = false
    @IBAction private func touchCard(_ sender: UIButton) {
        if alreadyChoosenTheme == false {
            chooseTheme()
            alreadyChoosenTheme = true
        }
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card was not in cardButtons")
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0) : #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }
        }
        scoreLabel.text = "Score: \(game.scoreNumber)"
        
    }
    //MARK: Creating array of emoji
    var emojiChoices = [String]()
    
    //MARK: Creating func with themes like Food, Love and etc.
    private func chooseTheme() {
        let theme: [String: [String]] = [
            "Fruits" : ["🍎", "🍐", "🍑", "🍒", "🥝", "🍌", ],
            "People" : ["🤱", "🙅‍♂️", "🙋‍♂️", "🤦‍♂️", "💆‍♀️", "🤷‍♀️", ],
            "Profesions" : ["👮‍♀️", "👷‍♂️", "💂‍♂️", "👩‍🍳", "👩‍🏫", "👨🏿‍🚒", ],
            "Love" : ["💌", "💑", "💟", "💒", "🖤", "😻", ],
            "Smile" : ["😀", "😂", "😇", "😜", "🤓", "😎", ],
            "Sport" : ["🏄‍♀️", "🚴‍♀️", "🏓", "🏂", "🥎", "🥊", ],
            "Eat" : ["🥕", "🍕", "🍜", "🌮", "🍔", "🥑", ],
        ]
        
        //MARK: Send keys from THEME dictionary to themeKeys, randomize this keys. Send values from TMEHE dictionary to emojiChoices.
        let themeKeys = Array(theme.keys)
        let themeIndex = Int(arc4random_uniform(UInt32(themeKeys.count)))
        emojiChoices = Array(theme.values)[themeIndex]
    print("Upload to Git hub")
    }
    
    //MARK: Creating DICTIONARY for display data after users click newGameButton
    private var emojiArray = [Int:String]()
    
    
    private  func emoji(for card: Card) -> String {
        if emojiArray[card.identifier] == nil, emojiChoices.count > 0 {
            emojiArray[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emojiArray[card.identifier] ?? "?"
    }
}


extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
           return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
