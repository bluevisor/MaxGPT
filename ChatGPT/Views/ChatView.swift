//
//  ChatView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/26/23.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(1..<5) { _ in
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("SecondaryBackgroundColor"))
                        .padding(.horizontal)
                        .padding(.top)
                }
            }
        }
    }
}

#Preview {
    ChatView()
}
