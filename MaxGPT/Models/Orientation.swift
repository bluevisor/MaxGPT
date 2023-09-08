//
//  Orientation.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/30/23.
//

import SwiftUI

enum Orientation {
    case portrait
    case landscape
    
    init(horizontalSizeClass: UserInterfaceSizeClass?, verticalSizeClass: UserInterfaceSizeClass?) {
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            self = .portrait
        } else {
            self = .landscape
        }
    }
}
