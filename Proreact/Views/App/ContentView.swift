//
//  ContentView.swift
//  Proreact
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI
import GameKit

struct ContentView: View {
    
    @State private var sheetActive = false
    @State private var sheetSelected: Sheets = .More
    
    @State private var showGameCenterError = false
    
    var leaderboardButton: some View {
        Button(action: presentLeaderboard) {
            Image(systemName: "chart.bar.fill").imageScale(.large)
        }
    }
    
    var moreButton: some View {
        Button(action: {
            self.sheetSelected = .More
            self.sheetActive.toggle()
        }) {
            Image(systemName: "gear").imageScale(.large)
        }
    }
    
    var body: some View {
        NavigationView {
            PlayView().navigationBarTitle("ProReact", displayMode: .inline)
                .sheet(isPresented: $sheetActive, content: sheetContent)
                .navigationBarItems(leading: leaderboardButton, trailing: moreButton)
                .alert(isPresented: $showGameCenterError) {
                    Alert(title: Text("Game Center disabled..."), message: Text("Enable Game Center in Settings to sync your highscore with all your devices and contribute to the leaderboard."), dismissButton: .default(Text("OK")))
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func presentLeaderboard() {
        if GameCenterUtils.sharedInstance.gameCenterEnabled {
            GameCenterUtils.sharedInstance.presentGameCenterLeaderboard()
        } else {
            self.showGameCenterError.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    enum Sheets {
        case More, Leaderboard
    }
    
    @ViewBuilder func sheetContent() -> some View {
        if sheetSelected == .More {
            MoreView()
        } else {
            MoreView()
        }
    }
}
