//
//  ModelDetailsView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/26/23.
//

import SwiftUI

struct ModelDetailsView: View {
    var model: GPTModel
    
    var body: some View {
        ZStack {
            VStack {
                VStack(alignment: .leading) {
                    Text(model.detailText)
                        .lineLimit(nil)
                        .padding(.bottom, 0.5)
                        .fontWeight(.medium)
                    Text(model.detailSubText)
                        .lineLimit(nil)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                
            }
            .frame(maxWidth: 450, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 13)
                .stroke(.gray, lineWidth: 0.5)
                .opacity(0.3)
                .background(.clear))
        }
    }
}

#Preview {
    ModelDetailsView(model: GPTModel.gpt3_5)
}
