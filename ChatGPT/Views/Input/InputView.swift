//
//  InputView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/25/23.
//

import SwiftUI
import OpenAIKit

struct InputView: View {
    @EnvironmentObject var viewModel: ChatViewModel
    @State var prompt: String = ""
    
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
                        Button(action: {}) {
                            Image(systemName: "waveform")
                                .resizable()
                                .frame(width: 19, height: 19)
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 12)
                        .opacity(0.8)
                    }
                }
            }
            Spacer()
            Button(action: {
                viewModel.startChat(prompt)
                            prompt = ""
            }) {
                
                // TODO: Fix button transparency issue
                SendIconView()
                    .disabled(prompt.isEmpty)
                    .opacity(prompt.isEmpty ? 0.5 : 1)
            }
            .disabled(prompt.isEmpty)
            .padding(.bottom, 4)
        }
    }
}

#Preview {
    InputView()
        .environmentObject(ChatViewModel())
}
