//
//  ModelButton.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/27/23.
//

import SwiftUI

struct ModelButtonView: View {
    @Binding var modelDetailsEngaged: Bool
    @Binding var animateIcon: Bool
    var model: GPTModel
    var isSelected: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .frame(height: 42)
                .foregroundColor(.clear)
                .padding(.leading, 4)
            HStack {
                Image(systemName: model.iconName)
                    .resizable()
                    .frame(width: 13, height: 15)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(isSelected ? model.iconColor : .gray)
                    .symbolEffect(.bounce.up.byLayer, value: animateIcon)
                Text(model.name)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(isSelected ? .primary : .gray)
                    .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                Image(systemName: "chevron.\(modelDetailsEngaged ? "up" : "down")")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 11, height: 11)
                    .opacity(isSelected ? 1 : 0)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
        }
        .contentShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

#Preview {
    ModelButtonView(modelDetailsEngaged: .constant(false), animateIcon: .constant(false), model: GPTModel.gpt3_5, isSelected: true)
}
