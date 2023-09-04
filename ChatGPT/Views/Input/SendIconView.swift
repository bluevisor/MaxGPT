//
//  SendButtonView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/26/23.
//

import SwiftUI

struct SendIconView: View {var body: some View {
        Circle()
            .frame(width: 28, height: 28)
            .foregroundColor(Color(.accent))
            .overlay() {
                Image(systemName: "arrow.up")
                    .resizable()
                    .bold()
                    .frame(width: 12, height: 14)
                    .padding(7)
                    .foregroundColor(Color(UIColor.systemBackground))
            }
    }
}

#Preview {
    SendIconView()
}
