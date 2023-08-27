//
//  NavBarView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/25/23.
//

import SwiftUI

struct NavBarView: View {
    @Binding var selectedModel: GPTModel
    @Binding var modelDetailsEngaged: Bool
    
    private let hapticFeedback = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 13.0)
                        .frame(height: 50)
                        .foregroundColor(Color("SecondaryBackgroundColor"))
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10.0)
                                .frame(height: 42)
                                .foregroundColor(selectedModel.name == "GPT 3.5" ? Color(UIColor.systemBackground) : Color("SecondaryBackgroundColor"))
                                .foregroundColor(.clear)
                                .padding(.leading, 4)
                            HStack {
                                Image(systemName: "bolt.fill")
                                    .resizable()
                                    .frame(width: 13, height: 15)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(selectedModel.name == "GPT 3.5" ? Color("GreenIconColor") : .gray)
                                Text("GPT-3.5")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(selectedModel.name == "GPT 3.5" ? .primary : .gray)
                                
                                Image(systemName: "chevron.\(modelDetailsEngaged ? "up" : "down")")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 11, height: 11)
                                    .opacity(selectedModel.name == "GPT 3.5" ? 1 : 0.0)
                                    .foregroundColor(.gray)
                            }
                        }
                        .onTapGesture {
                            if selectedModel.name == "GPT 4" {
                                selectedModel = GPTModel.gpt3_5
                                hapticFeedback.impactOccurred()
                            } else {
                                modelDetailsEngaged.toggle()
                            }
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 10.0)
                                .frame(height: 42)
                                .foregroundColor(selectedModel.name == "GPT 4" ? Color(UIColor.systemBackground) : Color("SecondaryBackgroundColor"))
                                .foregroundColor(.clear)
                                .padding(.trailing, 4)
                            HStack {
                                Image(systemName: "sparkles")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(selectedModel.name == "GPT 4" ? Color("LightBlueIconColor") : .gray)
                                Text("GPT-4")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(selectedModel.name == "GPT 4" ? .primary : .gray)
                                Image(systemName: "chevron.\(modelDetailsEngaged ? "up" : "down")")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 11, height: 11)
                                    .opacity(selectedModel.name == "GPT 4" ? 1 : 0.0)
                                    .foregroundColor(.gray)
                            }
                        }
                        .onTapGesture {
                            if selectedModel.name == "GPT 3.5" {
                                selectedModel = GPTModel.gpt4
                                hapticFeedback.impactOccurred()
                            } else {
                                modelDetailsEngaged.toggle()
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NavBarView(selectedModel: .constant(GPTModel.gpt3_5), modelDetailsEngaged: .constant(false))
}
