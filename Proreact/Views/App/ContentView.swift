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
    
    var leaderboardButton: some View {
        Button(action: {
            
            if GameCenterUtils.sharedInstance.gameCenterEnabled {
                
                let rootVC = UIApplication.shared.windows.first?.rootViewController
                if let vc = GameCenterUtils.sharedInstance.gameCenterViewController {
                    rootVC?.present(vc, animated: true, completion: nil)
                }
                
            } else {
                
                print("game center not here - erroré")
                
            }
            
        
        }) {
            Image(systemName: "chart.bar.fill").imageScale(.large)
        }
    }
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController:
        GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
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
        }.navigationViewStyle(StackNavigationViewStyle())
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
