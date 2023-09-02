//
//  ChatViewModel.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 9/1/23.
//

import SwiftUI
import OpenAIKit

@MainActor
class ChatViewModel: ObservableObject {
    let openAI = OpenAIKit(apiToken: (Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String)!)
    
    @Published var chatMessages: [AIMessage] = []
    @Published var accumulatingMessage: String = ""
    @Published var isFinished: Bool = true
    
    func sendMessage(_ message: String) {
        chatMessages.append(AIMessage(role: .user, content: message))
        isFinished = false
        openAI.sendStreamChatCompletion(newMessage: AIMessage(role: .assistant, content: message), previousMessages: chatMessages, model: .gptV3_5(.gptTurbo), maxTokens: 2048) { [weak self] streamResponse in
            switch streamResponse {
            case .success(let streamResult):
                if let chunk = streamResult.message?.choices.first?.message?.content {
                    DispatchQueue.main.async {
                        print(chunk)
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        self?.accumulatingMessage.append(chunk)
                    }
                }
                if streamResult.isFinished  {
                    self?.isFinished = true
                    self?.chatMessages.append(AIMessage(role: .assistant, content: self?.accumulatingMessage!))
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension AIMessage: Identifiable {
    public var id: UUID {
        UUID()
    }
}
