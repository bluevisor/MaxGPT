//
//  SendButtonView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/26/23.
//

import SwiftUI

struct InputIconView: View {
    @EnvironmentObject var chatViewModel: ChatViewModel
    
    var iconName: String {
        if !chatViewModel.isFinished {
            return "stop.fill"
        } else {
            return "arrow.up"
        }
    }
    
    var body: some View {
        Circle()
            .frame(width: 28, height: 28)
            .foregroundColor(Color(.accent))
            .overlay() {
                Image(systemName: iconName)
                    .resizable()
                    .bold()
                    .frame(width: 12, height: 14)
                    .padding(7)
                    .foregroundColor(Color(UIColor.systemBackground))
            }
    }
}

#Preview {
    InputIconView()
        .environmentObject(ChatViewModel())
}
