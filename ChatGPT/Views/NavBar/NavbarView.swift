//
//  NavbarView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/27/23.
//

import SwiftUI

struct NavbarView: View {
    @EnvironmentObject var chatViewModel: ChatViewModel
    @Binding var modelDetailsEngaged: Bool
    @Binding var selectedModel: GPTModel
    @Binding var orientation: Orientation
    @Binding var keyboardIsVisible: Bool
    @Binding var settingsEngaged: Bool
    
    private let hapticFeedback = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        ZStack(alignment: .top) {
            if chatViewModel.chatMessages.isEmpty {
                VStack(spacing: 5) {
                    HStack {
                        VStack(spacing: 5) {
                            ModelSelectorView(modelDetailsEngaged: $modelDetailsEngaged, selectedModel: $selectedModel)
                                .padding(.top, orientation == .landscape ? 10 : 0)
                            
                            if modelDetailsEngaged && orientation == .landscape {
                                ModelDetailsView(model: selectedModel)
                            }
                        }
                        // For placement purposes
                        if orientation == .portrait {
                            MenuView(settingsEngaged: $settingsEngaged)
                                .environmentObject(chatViewModel)
                                .foregroundColor(.clear)
                                .opacity(0)
                                .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        }
                    }
                    if modelDetailsEngaged && orientation == .portrait {
                        ModelDetailsView(model: selectedModel)
                        
                    }
                }
                .animation(.easeOut(duration: 0.15), value: modelDetailsEngaged)
            }
            HStack {
                Spacer()
                MenuView(settingsEngaged: $settingsEngaged)
                    .environmentObject(chatViewModel)
                    .onTapGesture {
                        hapticFeedback.impactOccurred()
                        modelDetailsEngaged = false
                    }
                    .padding(.top, orientation == .landscape ? 10 : 0)
            }
        }
        .onChange(of: keyboardIsVisible) {
            if keyboardIsVisible {
                modelDetailsEngaged = false
            }
        }
    }
}

#Preview {
    NavbarView(modelDetailsEngaged: .constant(true),
               selectedModel: .constant(GPTModel.gpt4),
               orientation: .constant(.portrait),
               keyboardIsVisible: .constant(false),
               settingsEngaged: .constant(false))
    .environmentObject(ChatViewModel())
}
