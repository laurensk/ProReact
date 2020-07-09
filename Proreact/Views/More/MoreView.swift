//
//  MoreView.swift
//  Proreact
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct SettingsToggle {
    var enableHapticFeedback: Bool = Settings.getSetting(setting: .EnableHapticFeedback) {
        didSet {
            Settings.setSetting(setting: .EnableHapticFeedback, value: enableHapticFeedback)
        }
    }
    var vibrateWhenTap: Bool = Settings.getSetting(setting: .VibrateWhenTap) {
        didSet {
            Settings.setSetting(setting: .VibrateWhenTap, value: vibrateWhenTap)
        }
    }
}

struct MoreView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    @State var settings = SettingsToggle()
    
    var dismissButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("Done").fontWeight(.semibold)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        VStack {
                            HStack {
                                Spacer()
                                Image(systemName: "hand.draw.fill").resizable().scaledToFit().padding(.bottom, 4).foregroundColor(Color(UIColor.systemGray))
                                Spacer()
                            }
                            Text("ProReact").font(.system(size: 25, design: .rounded)).fontWeight(.bold)
                        }.padding()
                    }.frame(height: 200)
                    Section(header: Text("SETTINGS")) {
                        VStack {
                            Toggle(isOn: $settings.enableHapticFeedback) {
                                HStack {
                                    Image(systemName: "bell.circle")
                                    Text("Haptic feedback")
                                }
                            }
                        }
                        VStack {
                            Toggle(isOn: $settings.vibrateWhenTap) {
                                HStack {
                                    Image(systemName: "bell.circle.fill")
                                    Text("Vibrate when you should tap")
                                }
                            }
                        }
                    }
                    Section(header: Text("ABOUT")) {
                        List {
                            Button(action: openWebsite) {
                                HStack {
                                    Text("Developer").foregroundColor(colorScheme == .dark ? Color.white : Color(UIColor.darkText))
                                    Spacer()
                                    Text("Laurens K.").foregroundColor(Color.gray)
                                }
                            }
                            Button(action: openTwitter) {
                                HStack {
                                    Text("Twitter").foregroundColor(colorScheme == .dark ? Color.white : Color(UIColor.darkText))
                                    Spacer()
                                    Text("@laurensk").foregroundColor(Color.gray)
                                }
                            }
                            Button(action: openMail) {
                                HStack {
                                    Text("Contact").foregroundColor(colorScheme == .dark ? Color.white : Color(UIColor.darkText))
                                    Spacer()
                                    Text("hello@laurensk.at").foregroundColor(Color.gray)
                                }
                            }
                        }
                    }
                }.listStyle(GroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)
            }.navigationBarTitle(Text("Settings & More"), displayMode: .inline)
                .navigationBarItems(trailing: dismissButton)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func openWebsite() {
        UIApplication.shared.open(URL(string: "https://www.laurensk.at")!)
    }
    
    func openTwitter() {
        UIApplication.shared.open(URL(string: "https://twitter.com/laurensk")!)
    }
    
    func openMail() {
        UIApplication.shared.open(URL(string: "mailto:hello@laurensk.at")!)
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
