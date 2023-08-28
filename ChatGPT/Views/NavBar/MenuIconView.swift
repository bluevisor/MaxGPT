//
//  Menu.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/26/23.
//

import SwiftUI

struct MenuIconView: View {var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15.0)
                .frame(width: 50, height: 50)
                .foregroundColor(Color("SecondaryBackgroundColor"))
            Image(systemName: "ellipsis")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 25)
                .opacity(0.9)
        }
    }
}

#Preview {
        MenuIconView()
}
