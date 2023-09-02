//
//  ContentView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/25/23.
//

import SwiftUI

struct MainView: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    @State var modelDetailsSelected: Bool = false
    @State var selectedModel: GPTModel = GPTModel.gpt3_5
    @State var orientation: Orientation = .portrait
    @State var keyboardIsVisible: Bool = false
    @State var settingsEngaged: Bool = false
    @StateObject private var chatViewModel = ChatViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                if chatViewModel.chatMessages.isEmpty {
                    Rectangle()
                        .frame(height: 52)
                        .foregroundColor(.clear)
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                ChatView()
                    .padding(.horizontal)
                    .environmentObject(chatViewModel)
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                if chatViewModel.chatMessages.isEmpty && !(keyboardIsVisible && orientation == .landscape) {
                    ExamplesView(orientation: $orientation)
                        .padding(.bottom, 8)
                        .opacity(modelDetailsSelected ? 0.3 : 1)
                        .disabled(modelDetailsSelected)
                        .animation(.easeOut(duration: 0.1), value: modelDetailsSelected)
                }
                InputView()
                    .padding(.bottom, 8)
                    .padding(.horizontal)
                    .animation(.easeInOut(duration: 0.1), value: orientation)
                    .environmentObject(chatViewModel)
            }
            
            VStack {
                NavbarView(modelDetailsEngaged: $modelDetailsSelected, selectedModel: $selectedModel, orientation: $orientation, keyboardIsVisible: $keyboardIsVisible, settingsEngaged: $settingsEngaged)
                    .environmentObject(chatViewModel)
                    .padding(.horizontal)
                Spacer()
            }
            
        }
        .onAppear {
            orientation = Orientation(horizontalSizeClass: horizontalSizeClass, verticalSizeClass: verticalSizeClass)
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { _ in
                keyboardIsVisible = true
            }
                        
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                keyboardIsVisible = false
            }
        }
        .onChange(of: horizontalSizeClass) {
            orientation = Orientation(horizontalSizeClass:  horizontalSizeClass, verticalSizeClass: verticalSizeClass)
        }
        .sheet(isPresented: $settingsEngaged, content: {
            SettingsView()
        })
    }
}

#Preview {
    MainView()
}
