//
//  NavBarView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/25/23.
//

import SwiftUI

struct ModelSelectorView: View {
    @Binding var modelDetailsEngaged: Bool
    @Binding var selectedModel: GPTModel
    @State var animateGPT4Icon: Bool = false
    @State var animateGPT3_5Icon: Bool = false
    
    private let hapticFeedback = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 13)
                    .frame(height: 52)
                    .foregroundColor(Color(.clear))
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 13))
                HStack {
                    if selectedModel.name == "GPT-4" {
                        Spacer()
                    }
                    RoundedRectangle(cornerRadius: 9)
                        .frame(width: (geometry.size.width/2)-4, height: 44)
                        .foregroundColor( Color(UIColor.systemBackground))
                        .padding(.horizontal, 4)
                    if selectedModel.name == "GPT-3.5" {
                        Spacer()
                    }
                }
                .animation(.spring(duration: 0.2, bounce: 0.2), value: selectedModel.name)
                HStack {
                    ModelButtonView(modelDetailsEngaged: $modelDetailsEngaged, animateIcon: $animateGPT3_5Icon, model: GPTModel.gpt3_5, isSelected: selectedModel.name == "GPT-3.5")
                        .onTapGesture {
                            if selectedModel.name == "GPT-4" {
                                selectedModel = GPTModel.gpt3_5
                                hapticFeedback.impactOccurred()
                                animateGPT3_5Icon.toggle()
                            } else {
                                modelDetailsEngaged.toggle()
                            }
                        }
                    ModelButtonView(modelDetailsEngaged: $modelDetailsEngaged, animateIcon: $animateGPT4Icon, model: GPTModel.gpt4, isSelected: selectedModel.name == "GPT-4")
                        .onTapGesture {
                            if selectedModel.name == "GPT-3.5" {
                                selectedModel = GPTModel.gpt4
                                hapticFeedback.impactOccurred()
                                animateGPT4Icon.toggle()
                            } else {
                                modelDetailsEngaged.toggle()
                            }
                        }
                }
            }
        }
        .frame(height: 55)
        .frame(maxWidth: 450)
        .onChange(of: selectedModel.name) {
            modelDetailsEngaged = true
        }
    }
}

#Preview {
    ModelSelectorView(modelDetailsEngaged: .constant(false), selectedModel: .constant(GPTModel.gpt3_5))
}
