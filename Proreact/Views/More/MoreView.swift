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
    
    @State var settings = SettingsToggle()
    
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
                            Text("Proreact").font(.system(size: 25, design: .rounded)).fontWeight(.bold)
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
                            HStack {
                                Text("Developer")
                                Spacer()
                                Text("Laurens K.").foregroundColor(Color.gray)
                            }.onTapGesture(perform: openWebsite)
                            HStack {
                                Text("Twitter")
                                Spacer()
                                Text("@laurensk").foregroundColor(Color.gray)
                            }.onTapGesture(perform: openTwitter)
                            HStack {
                                Text("Contact")
                                Spacer()
                                Text("hello@laurensk.at").foregroundColor(Color.gray)
                            }.onTapGesture(perform: openMail)
                        }
                    }
                }.listStyle(GroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)
            }.navigationBarTitle(Text("Settings & More"), displayMode: .inline)
                .navigationViewStyle(StackNavigationViewStyle())
        }
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
