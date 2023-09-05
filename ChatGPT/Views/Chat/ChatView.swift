//
//  ChatView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/26/23.
//

import SwiftUI
import OpenAIKit

struct ChatView: View {
    @EnvironmentObject var chatViewModel: ChatViewModel
    @State private var currentColorIndex = 0
    @State private var circleColor: Color = .teal
    private let colors: [Color] = [.teal, .orange, .blue, .pink, .purple]
    
    
    private func changeColor() {
        currentColorIndex = (currentColorIndex + 1) % colors.count
        circleColor = colors[currentColorIndex]
    }
    
    var body: some View {
        if chatViewModel.chatMessages.isEmpty {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                Circle()
                    .frame(width: 25, height: 25)
                    .foregroundColor(circleColor)
                    .animation(.linear(duration: 10), value: circleColor)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
                            changeColor()
                        }
                    }
            }
        } else {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(chatViewModel.chatMessages) { message in
                        ChatCardView(message: message)
                    }
                    if !chatViewModel.isFinished {
                        ChatCardView(message: AIMessage(role: .assistant, content: chatViewModel.accumulatingMessage))
                    }
                }
                .padding(.top, 37)
                .padding(.bottom)
                .padding(.horizontal, 10)
            }
            .padding(.top, 0.1)
        }
        
    }
}

#Preview {
    ChatView()
        .environmentObject(ChatViewModel())
}
