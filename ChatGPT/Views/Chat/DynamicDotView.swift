//
//  DynamicDotView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 9/5/23.
//

import SwiftUI

struct DynamicDotView: View {
    @EnvironmentObject var chatViewModel: ChatViewModel
    @State private var currentColorIndex = 0
    @State private var circleColor: Color = .teal
    @State private var typeWriterEffectIsActive: Bool = false
    @State private var displayedText: String = ""
    @Binding var keyboardIsVisible: Bool
    
    private let targetText = "ChatGPT"
    private let lightHapticFeedback = UIImpactFeedbackGenerator(style: .soft)
    private let mediumHapticFeedback = UIImpactFeedbackGenerator(style: .medium)
    private let colors: [Color] = [.teal, .orange, .blue, .pink, .purple]
    
    
    private func changeColor() {
        currentColorIndex = (currentColorIndex + 1) % colors.count
        circleColor = colors[currentColorIndex]
    }
    
    private func typeWriterEffect() {
        if displayedText.count < targetText.count && typeWriterEffectIsActive {
            let index = targetText.index(targetText.startIndex, offsetBy: displayedText.count)
            displayedText.append(targetText[index])
            mediumHapticFeedback.impactOccurred()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {
                typeWriterEffect()
            }
        }
    }
    
    private func reverseTypeWriterEffect() {
        typeWriterEffectIsActive = false
        if !displayedText.isEmpty {
            displayedText.removeLast()
            lightHapticFeedback.impactOccurred()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.03) {
                reverseTypeWriterEffect()
            }
        }
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Text(displayedText)
                .font(.title)
                .fontWeight(.semibold)
            Circle()
                .frame(width: 25, height: 25)
                .foregroundColor(chatViewModel.chatMessages.isEmpty ? circleColor : .white)
                .padding(.leading, 2)
                .animation(.linear(duration: 10), value: circleColor)
                .onAppear {
                    typeWriterEffectIsActive = true
                    Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
                        changeColor()
                    }
                }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                typeWriterEffect()
            }
        }
        .onChange(of: keyboardIsVisible) {
            if keyboardIsVisible && !displayedText.isEmpty {
                reverseTypeWriterEffect()
            }
        }
    }
}
    
#Preview {
    DynamicDotView(keyboardIsVisible: .constant(false))
        .environmentObject(ChatViewModel())
}
