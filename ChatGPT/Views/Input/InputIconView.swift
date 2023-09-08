//
//  SendButtonView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/26/23.
//

import SwiftUI

struct InputIconView: View {
    @EnvironmentObject var chatViewModel: ChatViewModel
    
    var icon: (iconName: String, iconWidth: CGFloat, iconHeight: CGFloat) {
        if !chatViewModel.isFinished {
            return ("stop.fill", 10, 10)
        } else if chatViewModel.isInterrupted {
            return ("forward.fill", 14, 12)
        } else {
            return ("arrow.up", 12, 14)
        }
    }
    
    var body: some View {
        Circle()
            .frame(width: 28, height: 28)
            .foregroundColor(Color(.accent))
            .overlay() {
                Image(systemName: icon.iconName)
                    .resizable()
                    .bold()
                    .frame(
                        width: icon.iconWidth,
                        height: icon.iconHeight
                    )
                    .padding(7)
                    .foregroundColor(Color(UIColor.systemBackground))
            }
    }
}

#Preview {
    InputIconView()
        .environmentObject(ChatViewModel())
}
