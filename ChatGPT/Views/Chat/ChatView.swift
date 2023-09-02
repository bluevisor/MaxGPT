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
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(chatViewModel.chatMessages) { message in
                        ChatCardView(message: message)
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    ChatView()
        .environmentObject(ChatViewModel())
}
