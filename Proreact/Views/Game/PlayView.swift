//
//  PlayView.swift
//  Proreact
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

public enum GameState {
    case Idle
    case Game
    case Result
    case TooFast
}

struct PlayView: View {
    
    @State private var currentView: GameState = .Idle
    @State private var milliseconds: Int = 0
    
    var body: some View {
        VStack {
            if currentView == .Idle {
                PlayIdleView(currentView: $currentView)
            } else if currentView == .Game {
                PlayGameView(currentView: $currentView, milliseconds: $milliseconds)
            } else if currentView == .Result {
                PlayResultView(currentView: $currentView, milliseconds: $milliseconds)
            } else if currentView == .TooFast {
                PlayzTooFastView(currentView: $currentView)
            } else {
                EmptyView()
            }
        }.onAppear {
            self.currentView = .Idle
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
