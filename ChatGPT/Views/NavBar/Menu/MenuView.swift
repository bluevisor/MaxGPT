//
//  MenuView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/28/23.
//

import SwiftUI

struct MenuView: View {
    var menuItems: [MenuItem] = [
    MenuItem(label: "New Chat", iconName: "plus"),
    MenuItem(label: "History", iconName: "clock"),
    MenuItem(label: "Settings", iconName: "gearshape.fill")
    ]
    
    var body: some View {
        List(menuItems) { item in
            HStack {
                Text(item.label)
                    .fontWeight(.medium)
                Spacer()
                Image(systemName: item.iconName)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 7)
        }
        .frame(width: 300)
        
    }
}

#Preview {
    MenuView()
}
