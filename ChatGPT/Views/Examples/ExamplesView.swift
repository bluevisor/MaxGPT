//
//  ExamplesScrollView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/26/23.
//

import SwiftUI

struct ExamplesView: View {
    @Binding var orientation: Orientation
    
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        if orientation == .portrait {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(PromptExample.examples.indices, id: \.self) { index in
                        ExampleCardView(orientation: $orientation, example: PromptExample.examples[index])
                            .padding(.leading, index == 0 ? 15 : 4)
                    }
                }
            }
        } else {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(PromptExample.examples.indices, id: \.self) { index in
                    ExampleCardView(orientation: $orientation, example: PromptExample.examples[index])
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 15)
            
        }
        
    }
}

#Preview {
    ExamplesView(orientation: .constant(.landscape))
}
