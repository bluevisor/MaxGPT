//
//  SettingsView.swift
//  ChatGPT
//
//  Created by Alex Ulanch on 8/31/23.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var settings = SettingsModel.shared
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
                                    .foregroundColor(.primary)
                                    .imageScale(.medium)
                            }
                        )
                        Spacer()
                        Text(verbatim: settings.email)
                            .opacity(0.6)
                    }
                    HStack {
                        Label(
                            title: {
                                Text("Subscription")
                            },
                            icon: {
                                Image(systemName: "plus.app")
                                    .foregroundColor(.primary)
                                    .imageScale(.medium)
                            }
                        )
                        Spacer()
                        Text(settings.subscriptionType)
                            .opacity(0.6)
                    }
                    HStack {
                        Label(
                            title: {
                                Text("Data Controls")
                            },
                            icon: {
                                Image(systemName: "slider.horizontal.3")
                                    .foregroundColor(.primary)
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
                                    .foregroundColor(.primary)
                                    .imageScale(.medium)
                            }
                        )
                        Spacer()
                        HStack {
                            Text(settings.customInstructionsEnabled ? "On" :  "Off")
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
                                    .foregroundColor(.primary)
                                    .imageScale(.medium)
                            }
                        )
                        Spacer()
                        Menu {
                            Button {
                                settings.colorSchemeOption = nil
                            } label: {
                                Text("System")
                            }
                            Button {
                                settings.colorSchemeOption = .dark
                            } label: {
                                Text("Dark")
                            }
                            Button {
                                settings.colorSchemeOption = .light
                            } label: {
                                Text("Light")
                            }
                        } label: {
                            Text(settings.colorSchemeOption?.description ?? "System")
                            Image(systemName: "chevron.up.chevron.down")
                                .imageScale(.small)
                        }.foregroundColor(.primary)
                        
                    }
                    HStack {
                        Label(
                            title: {
                                Text("New Features")
                            },
                            icon: {
                                Image(systemName: "testtube.2")
                                    .foregroundColor(.primary)
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
                                    .foregroundColor(.primary)
                                    .imageScale(.medium)
                            }
                        )
                        Spacer()
                        Toggle(isOn: $settings.hapticFeedbackEnabled) { EmptyView() }
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
                                    .foregroundColor(.primary)
                                    .imageScale(.medium)
                            }
                        )
                        Spacer()
                        Text(settings.mainLanguage)
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
                                    .foregroundColor(.primary)
                                    .imageScale(.medium)
                            }
                        )
                    }
                    HStack {
                        Label(
                            title: { Text("Terms of Use") },
                            icon: {
                                Image(systemName: "newspaper")
                                    .foregroundColor(.primary)
                                    .imageScale(.medium)
                            }
                        )
                    }
                    HStack {
                        Label(
                            title: { Text("Privacy Policy") },
                            icon: {
                                Image(systemName: "lock")
                                    .foregroundColor(.primary)
                                    .imageScale(.medium)
                            }
                        )
                    }
                    HStack {
                        Label(
                            title: { Text("Licenses") },
                            icon: {
                                Image(systemName: "book.closed.fill")
                                    .foregroundColor(.primary)
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
                            title: { Text("GPT Custom for iOS") },
                            icon: {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.primary)
                                    .imageScale(.medium)
                            }
                        )
                        Spacer()
                        Text("1.69 (420)")
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
            .preferredColorScheme(settings.colorSchemeOption)
        }
    }
}

#Preview {
    SettingsView(settingsEngaged: .constant(true))
}
