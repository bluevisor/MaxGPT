//
//  ExamplesScrollView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/26/23.
//

import SwiftUI

struct ExamplesView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    var body: some View {
        if horizontalSizeClass == .compact {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(PromptExample.examples) { example in
                        ExampleCardView(example: example)
                            .padding(.leading, 4)
                    }
                }
                .padding(.leading, 11)
                .padding(.trailing, 15)
            }
        } else {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(PromptExample.examples.indices, id: \.self) { index in
                    ExampleCardView(example: PromptExample.examples[index])
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 15)
            
        }
        
    }
}

#Preview {
    ExamplesView()
}
