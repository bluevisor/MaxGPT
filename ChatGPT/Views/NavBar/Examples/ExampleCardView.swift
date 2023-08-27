//
//  ExampleCard.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/26/23.
//

import SwiftUI

struct ExampleCardView: View {
    var example: PromptExample
    
    var body: some View {

        VStack(alignment: .leading) {
            Text(example.text)
                .fontWeight(.medium)
            Text(example.subtext)
                .foregroundColor(.gray)
                .font(.callout)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 13)
                .foregroundColor(Color("SecondaryBackgroundColor"))
                .frame(height: 65)
        )
    }
}

#Preview {
    ExampleCardView(example: GPTModel.promptExamples[0])
}
