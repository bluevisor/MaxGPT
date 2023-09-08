//
//  Menu.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/26/23.
//

import SwiftUI

struct MenuIconView: View {var body: some View {
        ZStack {
            Image(systemName: "ellipsis")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 18, height: 18)
                .foregroundColor(.primary)
                .padding(17)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 13))
        }
    }
}

#Preview {
        MenuIconView()
}
