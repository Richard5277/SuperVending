//
//  Words.swift
//  SpeechBase
//
//  Created by Greg Goralski on 3/9/17.
//  Copyright © 2017 Greg Goralski. All rights reserved.
//

import Foundation

struct WordAction {
    let word: String
    let action: String
}

class WordsSet {
    
    var targetWord: WordAction?
    
    static var wordsWithActions: [WordAction] = {
        return [
            WordAction(word: "cookie", action: "selectCookie"),
            WordAction(word: "water", action: "selectWater"),
            WordAction(word: "coke", action: "selectCoke"),
            WordAction(word: "apple", action: "selectApple"),
            WordAction(word: "chips", action: "selectChips"),
            WordAction(word: "banana", action: "selectBanana"),
            WordAction(word: "check", action: "checkOut"),
            WordAction(word: "cancel", action: "cancelSelection")
        ]
    }()
    
    static func searchFor(word: String) -> WordAction? {
        return wordsWithActions.filter { word.lowercased().contains($0.word) }.first
    }
}
