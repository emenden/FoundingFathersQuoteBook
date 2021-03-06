//
//  QuoteDeck.swift
//  FoundingFathersQuoteBook
//
//  Created by Emily Prigmore on 9/17/18.
//  Copyright © 2018 IS 543. All rights reserved.
//

import Foundation

class QuoteDeck {
    // PROPERTIES
    var tagSet: [String] = []
    
    let quotes = [
        Quote(text: """
                        Do you want to know who you are? Don&rsquo;t ask. Act!
                        Action will delineate and define you.
                    """,
              speaker: "Thomas Jefferson",
              tags: [ "motivational", "action" ]),
        Quote(text: """
                        Facts are stubborn things; and whatever may be our wishes,
                        our inclinations, or the dictates of our passions, they cannot
                        alter the state of facts and evidence.
                    """,
              speaker: "John Adams",
              tags: [ "facts", "wishes", "stubborn" ]),
        Quote(text: "Great is the guilt of an unnecessary war.",
              speaker: "John Adams",
              tags: [ "guilt", "war" ]),
        Quote(text: """
                        Happiness depends more upon the internal frame of a person&rsquo;s
                        own mind, than on the externals in the world.
                    """,
              speaker: "George Washington",
              tags: [ "happiness" ]),
        Quote(text: "Human happiness and moral duty are inseparably connected.",
              speaker: "George Washington",
              tags: [ "duty", "happiness", "honor" ]),
        Quote(text: """
                        I must study politics and war that my sons may have liberty
                        to study mathematics and philosophy.
                    """,
              speaker: "John Adams",
              tags: [ "war", "politics", "philosophy" ]),
        Quote(text: "It is better to be alone than in bad company.",
              speaker: "George Washington",
              tags: [ "character", "honor", "reputation" ]),
        Quote(text: "It is better to offer no excuse than a bad one.",
              speaker: "George Washington",
              tags: [ "confession", "lies", "lying", "excuses", "truth" ]),
        Quote(text: """
                        Nothing can stop the man with the right mental attitude from achieving his
                        goal; nothing on earth can help the man with the wrong mental attitude.
                    """,
              speaker: "Thomas Jefferson",
              tags: [ "attitude", "achieving", "goal" ])
    ]
    
    // SINGLETON PATTERN
    static let sharedInstance = QuoteDeck()
    private init() {
        update()
    }
    
    // PRIVATE HELPERS
    private func update() {
        tagSet = []
        
        for quote in quotes {
            for tag in quote.tags {
                if !tagSet.contains(tag) {
                    tagSet.append(tag)
                }
            }
        }
        tagSet = tagSet.sorted()
    }
    
    // PUBLIC HELPERS
    func quotesForTag(_ tag: String) -> [Quote] {
        var matchingQuotes: [Quote] = []
        
        for quote in quotes {
            if quote.tags.contains(tag) {
                matchingQuotes.append(quote)
            }
        }
        return matchingQuotes
    }
    
}
