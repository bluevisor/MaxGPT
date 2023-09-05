//
//  MarkdownRenderer.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 9/4/23.
//

import SwiftUI
import Markdown
import Markdownosaur

class MarkdownRenderer {
    var markdownosaur = Markdownosaur()
    var source: String
    
    init(source: String) {
        self.source = source
    }
    
    func render() -> AttributedString? {
        let document = Document(parsing: source)
        let attributedString = markdownosaur.attributedString(from: document)
        do {
            return try AttributedString(attributedString, including: \.uiKit)
        } catch {
            print("Error converting NSAttributedString to AttributedString: \(error)")
            return nil
        }
    }
}

struct AttributedText: UIViewRepresentable {
    var text: NSAttributedString
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.sizeToFit()
        label.layoutIfNeeded()
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.attributedText = text
    }
}
