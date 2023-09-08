//
//  ChatCardView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 9/1/23.
//

import SwiftUI
import OpenAIKit

struct ChatCardView: View {
    @EnvironmentObject var viewModel: ChatViewModel
    var message: AIMessage
    var isNewMessage: Bool
    var animation: Namespace.ID
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                    if message.role == .user {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.green)
                    } else {
                        ZStack {
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                            Image("OpenAILogo")
                                .resizable()
                                .frame(width: 12, height: 12)
                        }
                    }
                    
                    Text(message.role == .user ? "USER" : "CHATGPT")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                HStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 20, height: 20)
                    if message.role == .assistant && isNewMessage {
                        Text("\(message.content)\(Image(systemName: "circle.fill"))")
                            .matchedGeometryEffect(id: "dot", in: animation)
                    } else {
                        Text(message.content)
                            .lineSpacing(0.5)
                    }
                }
                .animation(.easeInOut, value: viewModel.chatMessages.isEmpty)
            }
            Spacer()
        }
    }
}

struct SubView_Previews: PreviewProvider {
    @Namespace static var previewNamespace
    
    static var previews: some View {
        ChatCardView(message: AIMessage(role: .assistant, content: ""), isNewMessage: true, animation: previewNamespace)
            .environmentObject(ChatViewModel())
    }
}
