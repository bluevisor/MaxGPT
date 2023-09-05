//
//  RegenerateIconView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 9/5/23.
//

import SwiftUI

struct RegenerateIconView: View {
    var body: some View {
        Circle()
            .frame(width: 28, height: 28)
            .foregroundColor(.green)
            .overlay() {
                Image(systemName: "gobackward")
                    .resizable()
                    .bold()
                    .frame(width: 12, height: 14)
                    .padding(7)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .rotationEffect(.degrees(-45))
            }
    }
}

#Preview {
    RegenerateIconView()
}
