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
        
    @State var prompt: String = ""
    @State var conversationStarted: Bool = false
    @State var modelDetailsSelected: Bool = false
    @State var selectedModel: GPTModel = GPTModel.gpt3_5
    @State var orientation: Orientation = .portrait
    @State var keyboardIsVisible: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                if !conversationStarted {
                    Rectangle()
                        .frame(height: 52)
                        .foregroundColor(.clear)
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                ChatView(conversationStarted: $conversationStarted, keyBoardIsVisible: $keyboardIsVisible)
                    .padding(.horizontal)
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                if !conversationStarted && !(keyboardIsVisible && orientation == .landscape) {
                    ExamplesView(orientation: $orientation)
                        .padding(.bottom, 8)
                        .opacity(modelDetailsSelected ? 0.3 : 1)
                        .disabled(modelDetailsSelected)
                        .animation(.easeOut(duration: 0.1), value: modelDetailsSelected)
                }
                InputView(prompt: $prompt, conversationStarted: $conversationStarted)
                    .padding(.bottom, 8)
                    .padding(.horizontal)
            }
            
            VStack {
                NavbarView(conversationStarted: $conversationStarted, modelDetailsEngaged: $modelDetailsSelected, selectedModel: $selectedModel, orientation: $orientation, keyboardIsVisible: $keyboardIsVisible)
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
    }
}

#Preview {
    MainView()
}
