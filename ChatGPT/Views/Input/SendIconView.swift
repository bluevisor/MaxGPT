//
//  SendButtonView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/26/23.
//

import SwiftUI

struct SendIconView: View {var body: some View {
        ZStack {
            Circle()
                .frame(width: 28, height: 28)
                .foregroundColor(Color(.accent))
            Image(systemName: "arrow.up")
                .resizable()
                .frame(width: 12, height: 14)
                .bold()
                .foregroundColor(Color(.white))
                
        }
    }
}

#Preview {
    SendIconView()
}
