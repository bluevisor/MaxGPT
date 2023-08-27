//
//  ContentView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/25/23.
//

import SwiftUI

struct MainView: View {
    @State var prompt: String = ""
    @State var selectedModel: GPTModel = GPTModel.gpt3_5
    @State var modelDetailsEngaged: Bool = false
    @State var conversationStarted: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    if conversationStarted {
                        VStack {
                            ForEach(1..<5) { _ in
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color("SecondaryBackgroundColor"))
                                    .padding(.horizontal)
                                    .padding(.top)
                            }
                        }
                    }
                }
                if !conversationStarted {
                    ExamplesView()
                        .padding(.vertical, 3)
                        .opacity(modelDetailsEngaged ? 0.3 : 1)
                        .disabled(modelDetailsEngaged)
                }
                InputView(prompt: $prompt, conversationStarted: $conversationStarted)
                    .padding(.horizontal)
                    .padding(.bottom, 7)
            }
            VStack {
                HStack {
                    if !conversationStarted {
                            NavBarView(selectedModel: $selectedModel, modelDetailsEngaged: $modelDetailsEngaged)
                                .padding(.leading)
                            
                    } else {
                        Spacer()
                    }
                    Menu(modelDetailsEngaged: $modelDetailsEngaged)
                        .padding(.trailing)
                }
                if modelDetailsEngaged && !conversationStarted {
                    ModelDetailsView(selectedModel: $selectedModel)
                        .padding(.horizontal)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    MainView()
}
