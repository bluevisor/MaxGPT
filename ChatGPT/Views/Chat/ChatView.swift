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
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(chatViewModel.chatMessages) { message in
                    ChatCardView(message: message)
                }
                if !chatViewModel.isFinished {
                    ChatCardView(message: AIMessage(role: .assistant, content: chatViewModel.accumulatingMessage))
                }
            }
            .padding(.vertical)
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    ChatView()
        .environmentObject(ChatViewModel())
}
