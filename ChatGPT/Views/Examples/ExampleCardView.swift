//
//  ExampleCard.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/26/23.
//

import SwiftUI

struct ExampleCardView: View {
    @Binding var orientation: Orientation
    var example: PromptExample
    
    var body: some View {
        if orientation == .portrait {
            VStack(alignment: .leading) {
                Text(example.text)
                    .fontWeight(.medium)
                Text(example.subtext)
                    .foregroundColor(.gray)
                    .font(.callout)
            }
            .padding(13)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .foregroundColor(Color(.clear))
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18))
            )
        } else {
            ZStack {
                RoundedRectangle(cornerRadius: 18)
                    .foregroundColor(Color(.clear))
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18))
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
            }
            
        }
    }
}

#Preview {
    ExampleCardView(orientation: .constant(.landscape), example: PromptExample.examples[0])
}
