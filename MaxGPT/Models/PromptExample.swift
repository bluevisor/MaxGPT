//
//  PromptExample.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/27/23.
//

import Foundation

struct PromptExample: Identifiable {
    let id = UUID()
    var text: String
    var subtext: String
    
}

extension PromptExample {
    static let examples: [PromptExample] = [ PromptExample(text: "Design a database schema",
                                                                 subtext: "for an online merch store"),
                                                   PromptExample(text: "Give me ideas",
                                                                 subtext: "for what to do with my kids' art"),
                                                   PromptExample(text: "Suggest some names",
                                                                 subtext: "for my cafe-by-day, bar-by-night business"),
                                                   PromptExample(text: "Recommend a dish",
                                                                 subtext: "to impress a date who's a picky eater") ]
}
