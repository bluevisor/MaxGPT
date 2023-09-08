//
//  MenuItemView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/28/23.
//

import SwiftUI

struct MenuItemView: View {
    var menuItem: MenuItem
    
    var body: some View {
        HStack {
            Text(menuItem.label)
                .padding()
                .fontWeight(.medium)
            Spacer()
            Image(systemName: menuItem.iconName)
                .padding()
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    MenuItemView(menuItem: MenuItem(label: "New Chat", iconName: "plus"))
}
