//
//  SettingsRow.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/31/23.
//

import SwiftUI

struct SettingsRow: View, Identifiable {
    let id = UUID()
    var setting: Setting
    var body: some View {
        HStack {
            Label(
                title: {
                    Text(setting.title)
                        .font(.headline)
                        .fontWeight(.regular)
                    
                },
                icon: { Image(systemName: setting.iconName) }
            )
            .padding()
            Spacer()
            setting.value
        }
        .background(.ultraThinMaterial)
    }
}

#Preview {
    SettingsRow(setting: Setting(title: "Email",
                                 iconName: "envelope",
                                 value: AnyView(Text("johndoe@gmail.com"))))
}
