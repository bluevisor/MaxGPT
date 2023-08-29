//
//  ExamplesScrollView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/26/23.
//

import SwiftUI

struct ExamplesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(PromptExample.examples.indices, id: \.self) { index in
                    ExampleCardView(example: PromptExample.examples[index])
                        .padding(.leading, index == 0 ? 15 : 4)
                }
            }
        }
    }
}

#Preview {
    ExamplesView()
}
