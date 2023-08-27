//
//  ModelDetailsView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/26/23.
//

import SwiftUI

struct ModelDetailsView: View {
    @Binding var selectedModel: GPTModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 13)
                .foregroundColor(.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(.gray, lineWidth: 0.5)
                        .opacity(0.3)
                )
            HStack {
                VStack(alignment: .leading) {
                    Text(selectedModel.detailText)
                        .padding(.bottom, 0.5)
                        .fontWeight(.medium)
                    Text(selectedModel.detailSubText)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                Spacer()
            }
            
        }
        .frame(height: 90)
        
    }
}

#Preview {
    ModelDetailsView(selectedModel: .constant(GPTModel.gpt3_5))
}
