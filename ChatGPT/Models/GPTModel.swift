//
//  GPTModel.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/25/23.
//

import Foundation

enum GPTModelVersion: Double {
    case _3_5 = 3.5
    case _4 = 4.0
}

struct GPTModel {
    var name: String
    var version: GPTModelVersion
    var detailText: String
    var detailSubText: String
}

struct PromptExample {
    var text: String
    var subtext: String
}

extension GPTModel {
    static let gpt3_5: GPTModel = GPTModel(name: "GPT 3.5",
                                           version: . _3_5,
                                           detailText: "Our fastest model, great for most\neveryday tasks.",
                                           detailSubText: "Available to Free and Plus users")
    static let gpt4: GPTModel = GPTModel(name: "GPT 4",
                                         version: . _4,
                                         detailText: "Our most capable model, great for tasks that\nrequire creativity and advanced reasoning.",
                                         detailSubText: "Available exclusively to Plus users")
    
    static let promptExamples: [PromptExample] = [ PromptExample(text: "Design a database schema",
                                                                 subtext: "for an online merch store"),
                                                   PromptExample(text: "Give me ideas",
                                                                 subtext: "for what to do with my kids' art"),
                                                   PromptExample(text: "Suggest some names",
                                                                 subtext: "for my cafe-by-day, bar-by-night business"),
                                                   PromptExample(text: "Recommend a dish",
                                                                 subtext: "to impress a date who's a picky eater") ]
}

