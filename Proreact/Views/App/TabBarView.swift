//
//  TabBarView.swift
//  Proreact
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    
    enum Tabs {
        case History
        case Play
        case About
    }
    
    @State private var selection: Tabs = .Play
    
    var body: some View {
        TabView(selection: $selection) {
            HistoryView()
                .tabItem {
                    Image(systemName: "timer").imageScale(.large)
                    Text("History")
            }.tag(Tabs.History)
            PlayView()
                .tabItem {
                    Image(systemName: "gamecontroller.fill").imageScale(.large)
                    Text("Game")
            }.tag(Tabs.Play)
            HistoryView()
                .tabItem {
                    Image(systemName: "info.circle").imageScale(.large)
                    Text("About")
            }.tag(Tabs.About)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
