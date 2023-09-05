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
    @State var prompt: String = ""
    @State var isRecording: Bool = false
    
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
            Group {
                if chatViewModel.stopGenerating {
                    Button {
                        chatViewModel.regenerate()
                        prompt = ""
                    } label: {
                        RegenerateIconView()
                            .padding(.bottom, 4)
                    }
                }
                Button {
                    if !chatViewModel.isFinished {
                        chatViewModel.cancelCurrentRequest()
                    } else {
                        chatViewModel.sendMessage(prompt)
                        prompt = ""
                    }
                    
                } label: {
                    InputIconView()
                        .environmentObject(chatViewModel)
                        .opacity(prompt.isEmpty && chatViewModel.isFinished ? 0.4 : 1)
                        .padding(.bottom, 4)
                }
                .disabled(prompt.isEmpty && chatViewModel.isFinished)
            }
            .animation(.bouncy, value: chatViewModel.stopGenerating)
        }
    }
}

#Preview {
    InputView()
        .environmentObject(ChatViewModel())
}
