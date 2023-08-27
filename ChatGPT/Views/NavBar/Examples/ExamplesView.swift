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
                ForEach(GPTModel.promptExamples.indices, id: \.self) { index in
                    ExampleCardView(example: GPTModel.promptExamples[index])
                        .padding(.leading, index == 0 ? 15 : 4)
                        .padding(.trailing, index == GPTModel.promptExamples.indices.count - 1 ? 15 : 0)
                }
            }
            
        }
    }
}

#Preview {
    ExamplesView()
}
