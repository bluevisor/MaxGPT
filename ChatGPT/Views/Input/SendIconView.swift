//
//  SendButtonView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/26/23.
//

import SwiftUI

struct SendIconView: View {
    @Binding var prompt: String
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 28, height: 28)
                .foregroundColor(Color(.accent))
                .opacity(prompt.isEmpty ? 0.5 : 1)
            Image(systemName: "arrow.up")
                .resizable()
                .frame(width: 12, height: 14)
                .bold()
                .foregroundColor(Color(.white))
                
        }
    }
}

#Preview {
    SendIconView(prompt: .constant(""))
}
