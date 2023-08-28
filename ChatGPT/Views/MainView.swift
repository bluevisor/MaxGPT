//
//  ContentView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/25/23.
//

import SwiftUI

struct MainView: View {
    @State var prompt: String = ""
    @State var conversationStarted: Bool = false
    @State var modelDetailsEngaged: Bool = false
    @State var selectedModel: GPTModel = GPTModel.gpt3_5
    
    var body: some View {
        ZStack {
            VStack {
                if conversationStarted {
                    ChatView()
                } else {
                    Spacer()
                    ExamplesView()
                        .padding(.bottom, 3)
                        .opacity(modelDetailsEngaged ? 0.3 : 1)
                        .disabled(modelDetailsEngaged)
                        .animation(.easeOut(duration: 0.1), value: modelDetailsEngaged)
                }
                InputView(prompt: $prompt, conversationStarted: $conversationStarted)
                    .animation(.easeInOut, value: prompt)
            }
            VStack {
                NavbarView(conversationStarted: $conversationStarted, modelDetailsEngaged: $modelDetailsEngaged, selectedModel: $selectedModel)
                Spacer()
            }
        
        }
        .padding(.horizontal)
        .padding(.bottom, 7)
        
    }
}

#Preview {
    MainView()
}
