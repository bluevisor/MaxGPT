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
    @Binding var keyboardIsVisible: Bool
    @Namespace private var animation
    
    var body: some View {
        Group {
            if chatViewModel.chatMessages.isEmpty {
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                    DynamicDotView(keyboardIsVisible: $keyboardIsVisible)
                            .environmentObject(chatViewModel)
                            .matchedGeometryEffect(id: "dot", in: animation)
                }
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(chatViewModel.chatMessages) { message in
                            ChatCardView(message: message, isNewMessage: false, animation: animation)
                        }
                        if !chatViewModel.isFinished {
                            ChatCardView(message: AIMessage(role: .assistant, content: chatViewModel.accumulatingMessage), isNewMessage: true, animation: animation)
                        }
                    }
                    .padding(.top, 37)
                    .padding(.bottom)
                    .padding(.horizontal, 10)
                }
                .padding(.top, 0.1)
            }
        }
        .animation(.easeInOut, value: chatViewModel.chatMessages.isEmpty)
    }
}

#Preview {
    ChatView(keyboardIsVisible: .constant(false))
        .environmentObject(ChatViewModel())
}
