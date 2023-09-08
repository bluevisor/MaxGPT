//
//  SettingsModel.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 9/4/23.
//

import Foundation
import SwiftUI

class SettingsModel: ObservableObject {
    
    static let shared = SettingsModel()
    
    @Published var email: String = "bluevisor@gmail.com"
    @Published var subscriptionType: String = "ChatGPT Plus"
    @Published var dataControlsEngaged: Bool = false
    @Published var customInstructionsEnabled: Bool = false
    @Published var colorSchemeOption: ColorScheme? = nil
    @Published var newFeaturesEngaged: Bool = false
    @Published var hapticFeedbackEnabled: Bool = true
    @Published var mainLanguage: String = "Auto-Detect"
    
    private init() {}
}

extension ColorScheme {
    var description: String {
        switch self {
        case .light:
            return "Light"
        case .dark:
            return "Dark"
        default:
            return "System"
        }
    }
}


