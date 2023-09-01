//
//  MenuView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/28/23.
//

import SwiftUI

struct MenuView: View {
    @Binding var conversationStarted: Bool
    @Binding var settingsEngaged: Bool
    
    var menuItems: [MenuItem] = [
    MenuItem(label: "New Chat", iconName: "plus"),
    MenuItem(label: "History", iconName: "clock"),
    MenuItem(label: "Settings", iconName: "gearshape.fill")
    ]
    
    var body: some View {
        Menu {
            ForEach(menuItems) { menuItem in
                Button {
                    if menuItem.label == "Settings" {
                        settingsEngaged.toggle()
                    } else {
                        conversationStarted = false
                    }
                } label: {
                    MenuItemView(menuItem: menuItem)
                }
            }
        } label: {
            MenuIconView()
        }
        
    }
}

#Preview {
    MenuView(conversationStarted: .constant(true), settingsEngaged: .constant(false))
}
