//
//  SettingsView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/31/23.
//

import SwiftUI

struct SettingsView: View {
    @Binding var settingsEngaged: Bool
    
    var body: some View {
        NavigationStack {
            List {
                Section("Account") {
                    HStack {
                        Label(
                            title: {
                                Text("Email")
                            },
                            icon: {
                                Image(systemName: "envelope")
                                    .foregroundColor(.white)
                                    .imageScale(.medium)
                            }
                        )
                        Spacer()
                        Text(verbatim: "johndoe@gmail.com")
                            .opacity(0.6)
                    }
                    HStack {
                        Label(
                            title: {
                                Text("Subscription")
                            },
                            icon: {
                                Image(systemName: "plus.app")
                                    .foregroundColor(.white)
                                    .imageScale(.medium)
                            }
                        )
                        Spacer()
                        Text("ChatGPT Plus")
                            .opacity(0.6)
                    }
                    HStack {
                        Label(
                            title: {
                                Text("Data Controls")
                            },
                            icon: {
                                Image(systemName: "slider.horizontal.3")
                                    .foregroundColor(.white)
                                    .imageScale(.medium)
                            }
                        )
                        Spacer()
                        Image(systemName: "chevron.right")
                            .imageScale(.small)
                            .bold()
                            .opacity(0.25)
                    }
                    HStack {
                        Label(
                            title: {
                                Text("Custom Instructions")
                            },
                            icon: {
                                Image(systemName: "ellipsis.bubble")
                                    .foregroundColor(.white)
                                    .imageScale(.medium)
                            }
                        )
                        Spacer()
                        HStack {
                            Text("Off")
                                .opacity(0.6)
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                                .bold()
                                .opacity(0.25)
                        }
                    }
                }
                Section {
                    
                        HStack {
                            Label(
                                title: {
                                    Text("Color Scheme")
                                },
                                icon: {
                                    Image(systemName: "moon.fill")
                                        .foregroundColor(.white)
                                        .imageScale(.medium)
                                }
                            )
                            Spacer()
                            Menu {
                                Text("System")
                                Text("Dark")
                                Text("Light")
                            } label: {
                                Text("System")
                                Image(systemName: "chevron.up.chevron.down")
                                    .imageScale(.small)
                            }.foregroundColor(.white)
                            
                        }
                        HStack {
                            Label(
                                title: {
                                    Text("New Features")
                                },
                                icon: {
                                    Image(systemName: "testtube.2")
                                        .foregroundColor(.white)
                                        .imageScale(.medium)
                                }
                            )
                            Spacer()
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                                .bold()
                                .opacity(0.25)
                        }
                        HStack {
                            Label(
                                title: {
                                    Text("Haptic Feedback")
                                },
                                icon: {
                                    Image(systemName: "water.waves")
                                        .foregroundColor(.white)
                                        .imageScale(.medium)
                                }
                            )
                            Spacer()
                            Toggle(isOn: .constant(true), label: {
                            })
                        }
                    
                } header: {
                    Text("App")
                } footer: {
                    Text("Haptic feedback will be automatically disabled if your device is low on battery.")
                }
                Section {
                    HStack {
                        Label(
                            title: {
                                Text("Main Language")
                            },
                            icon: {
                                Image(systemName: "waveform")
                                    .foregroundColor(.white)
                                    .imageScale(.medium)
                            }
                        )
                        Spacer()
                        Text("Auto-Detect")
                        Image(systemName: "chevron.up.chevron.down")
                            .imageScale(.small)
                    }
                } header: {
                    Text("SPEECH")
                } footer: {
                    Text("For best results, select the language you mainly speak. If it's not listed, it may still be supported via auto-detection.")
                }
                Section("ABOUT") {
                    HStack {
                        Label(
                            title: { Text("Help Center") },
                            icon: {
                                Image(systemName: "questionmark.circle.fill")
                                    .foregroundColor(.white)
                                    .imageScale(.medium)
                            }
                        )
                    }
                    HStack {
                        Label(
                            title: { Text("Terms of Use") },
                            icon: {
                                Image(systemName: "newspaper")
                                    .foregroundColor(.white)
                                    .imageScale(.medium)
                            }
                        )
                    }
                    HStack {
                        Label(
                            title: { Text("Privacy Policy") },
                            icon: {
                                Image(systemName: "lock")
                                    .foregroundColor(.white)
                                    .imageScale(.medium)
                            }
                        )
                    }
                    HStack {
                        Label(
                            title: { Text("Licenses") },
                            icon: {
                                Image(systemName: "book.closed.fill")
                                    .foregroundColor(.white)
                                    .imageScale(.medium)
                            }
                        )
                        Spacer()
                        Image(systemName: "chevron.right")
                            .imageScale(.small)
                            .bold()
                            .opacity(0.25)
                    }
                    HStack {
                        Label(
                            title: { Text("ChatGPT for iOS") },
                            icon: {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.white)
                                    .imageScale(.medium)
                            }
                        )
                        Spacer()
                        Text("1.2023.235 (4915)")
                            .opacity(0.6)
                    }
                }
                Section {
                    Label {
                        Text("Sign out")
                            .foregroundStyle(.red)
                    } icon: {
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                            .foregroundColor(.red)
                            .imageScale(.medium)
                    }

                }

            }
            .listStyle(.grouped)
            .background(Color(.gray))
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        settingsEngaged.toggle()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.ultraThinMaterial)
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView(settingsEngaged: .constant(true))
}
