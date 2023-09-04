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
        HStack {
            VStack(alignment: .leading) {
                Text(example.text)
                    .fontWeight(.medium)
                Text(example.subtext)
                    .foregroundColor(.gray)
                    .font(.callout)
            }
            Spacer()
        }
        .padding(13)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18))
    }
}

#Preview {
    ExampleCardView(example: PromptExample.examples[0])
}
