//
//  NavbarView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/27/23.
//

import SwiftUI

struct NavbarView: View {
    @Binding var conversationStarted: Bool
    @Binding var modelDetailsEngaged: Bool
    @Binding var selectedModel: GPTModel
    
    private let hapticFeedback = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                if !conversationStarted {
                    VStack {
                        HStack {
                            VStack {
                                ModelSelectorView(modelDetailsEngaged: $modelDetailsEngaged, selectedModel: $selectedModel)
                                    .frame(maxWidth: 450)
                                if modelDetailsEngaged && geometry.size.width > 500 {
                                    ModelDetailsView(model: selectedModel)
                                        .frame(maxWidth: 450)
                                }
                            }
                            if geometry.size.width < 500 {
                                RoundedRectangle(cornerRadius: 15.0)
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.clear)
                            }
                        }
                        if modelDetailsEngaged && geometry.size.width < 500 {
                            ModelDetailsView(model: selectedModel)
                        }
                    }
                    .animation(.easeOut(duration: 0.15), value: modelDetailsEngaged)
                }
                HStack {
                    Spacer()
                    MenuIconView()
                        .onTapGesture {
                            hapticFeedback.impactOccurred()
                            modelDetailsEngaged = false
                        }
                }
            }
            .padding(.top, geometry.size.width > 500 ? 10 : 0)
        }
        .frame(height: 50)
    }
}

#Preview {
    NavbarView(conversationStarted: .constant(false), modelDetailsEngaged: .constant(true), selectedModel: .constant(GPTModel.gpt3_5))
}
