//
//  ChatViewModel.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 9/1/23.
//

import SwiftUI
import OpenAIKit

class ChatViewModel: ObservableObject {
    @Published var chatMessages: [AIMessage] = []
    @Published var accumulatingMessage: String = ""
    @Published var isFinished: Bool = true
    @Published var isInterrupted: Bool = false
    
    lazy var openAI: OpenAIKit = {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("API_KEY not found in Info.plist")
        }
        return OpenAIKit(apiToken: apiKey)
    }()
    
    func sendMessage(_ message: String) {
        
        accumulatingMessage = ""
        isFinished = false
        
        if !isInterrupted {
            chatMessages.append(AIMessage(role: .user, content: message))
        } else {
            isInterrupted = false
        }
        
        openAI.sendStreamChatCompletion(newMessage: AIMessage(role: .assistant, content: message), previousMessages: chatMessages, model: .gptV3_5(.gptTurbo), maxTokens: 2048) { streamResponse in
            guard !self.isInterrupted else { return }
            switch streamResponse {
            case .success(let streamResult):
                if let chunk = streamResult.message?.choices.first?.message?.content {
                    DispatchQueue.main.async {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        self.accumulatingMessage.append(chunk)
                    }
                }
                if streamResult.isFinished  {
                    DispatchQueue.main.async {
                        self.isFinished = true
                        self.chatMessages.append(AIMessage(role: .assistant, content: self.accumulatingMessage))
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func cancelCurrentRequest() {
        isInterrupted = true
        isFinished = true
        self.chatMessages.append(AIMessage(role: .assistant, content: self.accumulatingMessage))
    }
    
    func continueGeneration() {
        guard self.chatMessages.last?.role == .assistant else { return }
        sendMessage("")
    }
}

extension AIMessage: Identifiable {
    public var id: UUID {
        UUID()
    }
}
