//
//  GPTModel.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/25/23.
//

import SwiftUI

enum GPTModelVersion: Double {
    case _3_5 = 3.5
    case _4 = 4.0
}

struct GPTModel {
    let name: String
    let model: GPTModelVersion
    let detailText: String
    let detailSubText: String
    let iconName: String
    let iconColor: Color
    
    static var gpt3_5: GPTModel = GPTModel(name: "GPT-3.5",
                                           model: . _3_5,
                                           detailText: "Our fastest model, great for most everyday tasks.",
                                           detailSubText: "Available to Free and Plus users",
                                           iconName: "bolt.fill",
                                           iconColor: Color("GreenIconColor"))
    
    static var gpt4: GPTModel = GPTModel(name: "GPT-4",
                                         model: . _4,
                                         detailText: "Our most capable model, great for tasks that require creativity and advanced reasoning.",
                                         detailSubText: "Available exclusively to Plus users",
                                         iconName: "sparkles",
                                         iconColor: Color("LightBlueIconColor"))

}
