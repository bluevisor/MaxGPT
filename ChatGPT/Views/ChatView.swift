//
//  ChatView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/26/23.
//

import SwiftUI

struct ChatView: View {
    @Binding var conversationStarted: Bool
    @Binding var keyBoardIsVisible: Bool
    @State private var displayedText: String = ""
    @State private var currentColorIndex = 0
    @State private var circleColor: Color = .teal
    @State private var typeWriterEffectIsActive: Bool = false
    
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
        Group {
            if !conversationStarted {
                VStack {
                    Spacer()
                    HStack(spacing: 0) {
                        Text(displayedText)
                            .font(.title)
                            .fontWeight(.semibold)
                        Circle()
                            .frame(height: 25)
                            .foregroundColor(circleColor)
                            .padding(.leading, 2)
                            .animation(.linear(duration: 10), value: circleColor)
                            .onAppear {
                                typeWriterEffectIsActive = true
                                Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
                                    changeColor()
                                }
                            }
                    }
                    Spacer()
                }
            } else {
                ScrollView {
                    Text("""
                         Jony Ive, whose full name is Sir Jonathan Ive, is a British industrial designer and one of the most influential figures in the design world. He is best known for his work at Apple Inc., where he played a pivotal role in shaping the design of many iconic products.
                             
                         Ive joined Apple in 1992 and quickly rose through the ranks. He became the Senior Vice President of Industrial Design, leading the design team responsible for creating products like the iMac, iPod, iPhone, iPad, MacBook, and Apple Watch. Ive's design philosophy emphasized simplicity, functionality, and a seamless integration of hardware and software.
                         
                         His work was characterized by clean lines, minimalist aesthetics, and innovative use of materials. Ive's design approach helped establish Apple's reputation for producing elegant and user-friendly products that combined advanced technology with thoughtful design.
                         
                         Ive's influence extended beyond hardware; he also played a role in shaping the design of Apple's software interfaces, including the iOS operating system. His collaboration with Steve Jobs was crucial in defining the look and feel of Apple's products during a transformative period for the company.
                         """)
                    .padding()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                typeWriterEffect()
            }
        }
        .onChange(of: keyBoardIsVisible) {
                if keyBoardIsVisible && !displayedText.isEmpty {
                    reverseTypeWriterEffect()
                }
            }
    }
}

#Preview {
    ChatView(conversationStarted: .constant(false), keyBoardIsVisible: .constant(false))
}
