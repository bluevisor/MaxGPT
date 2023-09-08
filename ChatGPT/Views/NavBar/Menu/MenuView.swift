//
//  MenuView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/28/23.
//

import SwiftUI
import Combine

struct MenuView: View {
    @EnvironmentObject var chatViewModel: ChatViewModel
    @State private var settingsEngaged: Bool = false
    
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
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        settingsEngaged.toggle()
                    } else {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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

extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

#Preview {
    MenuView()
        .environmentObject(ChatViewModel())
}
