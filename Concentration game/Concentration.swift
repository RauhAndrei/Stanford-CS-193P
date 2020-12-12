//
//  Concentration.swift
//  Concentration game
//
//  Created by Rauh Andrei on 12/2/20.
//  Copyright © 2020 Rauh Andrei. All rights reserved.
//

import Foundation
class Concentration {
    var cards = [Card]()
    
    private var indexOfOneAndOnlyFacedUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
            
        }
    }
    var scoreNumber = 0
    
    var seenCards: Set<Int> = []
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)) : Choosen index out of range")
        //MARK: Chek if cards is same. If yes add 2 points
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFacedUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    scoreNumber += 2
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                //MARK: Chek if card was selected and penalizing 1 point for every previously seen card that is involved in a mismatch
                if seenCards.contains(index) {
                    scoreNumber -= 1
                }
                if seenCards.contains(matchIndex) {
                    scoreNumber -= 1
                }
                
                //MARK: Insert card in array if it's first seeing
                seenCards.insert(index)
                seenCards.insert(matchIndex)
                
                cards[index].isFaceUp = true
                
            } else {
                indexOfOneAndOnlyFacedUpCard = index
            }
        }
    }
    
    
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 1 , "Concentration.init(at: \(numberOfPairsOfCards)) : You must have at least one pair of cards.")
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards.shuffle()
            cards += [card, card]
            
            //MARK: To do shuffle the cards
            
            
        }
    }
}
