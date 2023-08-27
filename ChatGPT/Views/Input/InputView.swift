//
//  InputView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/25/23.
//

import SwiftUI

struct InputView: View {
    @Binding var prompt: String
    @Binding var conversationStarted: Bool
    
    var body: some View {
        HStack(alignment: .bottom) {
            ZStack {
                TextField("Message", text: $prompt, axis: .vertical)
                    .frame(minHeight: 25)
                    .padding(6)
                    .padding(.leading, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .strokeBorder(.gray,lineWidth: 1)
                            .background(.clear)
                            .opacity(0.5)
                    )
                    .gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)})
                if prompt.isEmpty {
                    HStack {
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "waveform")
                                .resizable()
                                .frame(width: 19, height: 19)
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 12)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            Spacer()
            Button {
                conversationStarted = true
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                prompt = ""
            }label: {
                SendIconView(prompt: $prompt)
            }
            .disabled(prompt.isEmpty)
            .padding(.bottom, 5)
        }
    }
}

#Preview {
    InputView(prompt: .constant(""), conversationStarted: .constant(false))
}
