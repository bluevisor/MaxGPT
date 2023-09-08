//
//  ContentView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/25/23.
//

import SwiftUI

struct MainView: View {
    @StateObject private var chatViewModel = ChatViewModel()
    @StateObject var settings = SettingsModel.shared
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var modelDetailsSelected: Bool = false
    @State private var selectedModel: GPTModel = GPTModel.gpt3_5
    @State private var keyboardIsVisible: Bool = false
    
    
    var body: some View {
        ZStack {
            VStack {
                if chatViewModel.chatMessages.isEmpty {
                    Rectangle()
                        .frame(height: 52)
                        .foregroundColor(.clear)
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                ChatView(keyboardIsVisible: $keyboardIsVisible)
                    .environmentObject(chatViewModel)
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                if chatViewModel.chatMessages.isEmpty && !(keyboardIsVisible && horizontalSizeClass != .compact) {
                    ExamplesView()
                        .padding(.bottom, 8)
                        .opacity(modelDetailsSelected ? 0.3 : 1)
                        .disabled(modelDetailsSelected)
                        .animation(.easeOut(duration: 0.1), value: modelDetailsSelected)
                }
                InputView()
                    .padding(.bottom, 8)
                    .padding(.horizontal)
                    .animation(.easeInOut(duration: 0.1), value: horizontalSizeClass)
                    .environmentObject(chatViewModel)
            }
            VStack {
                NavbarView(modelDetailsEngaged: $modelDetailsSelected, selectedModel: $selectedModel, keyboardIsVisible: $keyboardIsVisible)
                    .environmentObject(chatViewModel)
                    .padding(.horizontal)
                Spacer()
            }
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { _ in
                keyboardIsVisible = true
            }
                        
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                keyboardIsVisible = false
            }
        }
        .preferredColorScheme(settings.colorSchemeOption)
    }
}

#Preview {
    MainView()
}
