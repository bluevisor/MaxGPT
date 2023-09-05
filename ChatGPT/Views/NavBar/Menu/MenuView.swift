//
//  MenuView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/28/23.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var chatViewModel: ChatViewModel
    @State var settingsEngaged: Bool = false
    
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
                        chatViewModel.chatMessages = []
                    }
                } label: {
                    MenuItemView(menuItem: menuItem)
                }
            }
        } label: {
            MenuIconView()
        }
        .sheet(isPresented: $settingsEngaged, content: {
            SettingsView(settingsEngaged: $settingsEngaged)
        })
        
        
    }
}

#Preview {
    MenuView()
        .environmentObject(ChatViewModel())
}
