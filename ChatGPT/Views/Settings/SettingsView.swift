//
//  SettingsView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/31/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            Section("Account") {
                HStack {
                    Label(
                        title: {
                            Text("Email")
                        },
                        icon: { Image(systemName: "envelope")
                            .foregroundColor(.white)}
                    )
                    Spacer()
                    Text("johndoe@gmail.com")
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                HStack {
                    Label(
                        title: {
                            Text("Subscription")
                        },
                        icon: { Image(systemName: "plus.app")
                            .foregroundColor(.white)}
                    )
                    Spacer()
                    Text("ChatGPT Plus")
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                HStack {
                    Label(
                        title: {
                            Text("Data Controls")
                        },
                        icon: { Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.white)}
                    )
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                HStack {
                    Label(
                        title: {
                            Text("Custom Instructions")
                        },
                        icon: { Image(systemName: "ellipsis.bubble")
                            .foregroundColor(.white)}
                    )
                    Spacer()
                    HStack {
                        Text("Off")
                        Image(systemName: "chevron.right")
                    }
                }
            }
            Section("App") {
                HStack {
                    Label(
                        title: {
                            Text("Color Scheme")
                        },
                        icon: { Image(systemName: "moon.fill")
                            .foregroundColor(.white)}
                    )
                    Spacer()
                    Menu {
                        Text("System")
                        Text("Dark")
                        Text("Light")
                    } label: {
                        Text("System")
                        Image(systemName: "chevron.up.chevron.down")
                    }.foregroundColor(.white)
                    
                }
                HStack {
                    Label(
                        title: {
                            Text("New Features")
                        },
                        icon: { Image(systemName: "testtube.2")
                            .foregroundColor(.white)}
                    )
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                HStack {
                    Label(
                        title: {
                            Text("Haptic Feedback")
                        },
                        icon: { Image(systemName: "water.waves")
                            .foregroundColor(.white)}
                    )
                    Spacer()
                    Toggle(isOn: .constant(true), label: {
                    })
                }
            }
        }
        .listStyle(.grouped)
        .background(Color(.gray))
    }
}

#Preview {
    SettingsView()
}
