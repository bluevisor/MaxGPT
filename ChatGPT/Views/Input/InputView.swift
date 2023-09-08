//
//  InputView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/25/23.
//

import SwiftUI
import OpenAIKit

struct InputView: View {
    @EnvironmentObject var chatViewModel: ChatViewModel
    @State private var prompt: String = ""
    @State private var isRecording: Bool = false
    
    var body: some View {
        HStack(alignment: .bottom) {
            ZStack {
                TextField("Message", text: $prompt, axis: .vertical)
                    .frame(minHeight: 25)
                    .padding(5)
                    .padding(.horizontal, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .strokeBorder(.gray,lineWidth: 0.8)
                            .background(Color.clear)
                            .opacity(0.5)
                    )
                    .gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)})
                if prompt.isEmpty {
                    HStack {
                        Spacer()
                        Button {
                            isRecording.toggle()
                        } label: {
                            Image(systemName: "waveform")
                                .resizable()
                                .frame(width: 19, height: 19)
                                .foregroundColor(.gray)
                        }
                        .symbolEffect(.variableColor.iterative.dimInactiveLayers.nonReversing, isActive: isRecording)
                        .padding(.trailing, 12)
                        .opacity(0.8)
                    }
                }
            }
            Button {
                if !chatViewModel.isFinished {
                    chatViewModel.cancelCurrentRequest()
                } else if chatViewModel.isInterrupted {
                    chatViewModel.continueGeneration()
                } else {
                    chatViewModel.sendMessage(prompt)
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    prompt = ""
                }
                
            } label: {
                InputIconView()
                    .environmentObject(chatViewModel)
                    .opacity(prompt.isEmpty && chatViewModel.isFinished && !chatViewModel.isInterrupted ? 0.5 : 1)
                    .padding(.bottom, 4)
            }
            .disabled(prompt.isEmpty && chatViewModel.isFinished && !chatViewModel.isInterrupted)
        }
    }
}

#Preview {
    InputView()
        .environmentObject(ChatViewModel())
}
