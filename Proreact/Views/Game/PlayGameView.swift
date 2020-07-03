//
//  PlayGameView.swift
//  Proreact
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct PlayGameView: View {
    
    enum Game {
        case Waiting
        case Press
    }
    
    @Binding var currentView: GameState
    @Binding var milliseconds: Int
    
    @State private var game: Game = .Waiting
    
    @State private var downTimeRemaining = RandomUtils.getRandomTime() / 1000
    @State private var downTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var upTimePassed = 0
    @State private var upTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            if game == .Waiting {
                Text("Wait....")
            } else {
                Text("Press now!!!")
            }
            Button(action: tapGesture) {
                Text("Tab Gesture")
            }
        }.onReceive(downTimer) { _ in
            self.downTimerReceive()
        }.onReceive(upTimer) { _ in
            self.upTimerReceive()
        }
    }
    
    func downTimerReceive() {
        if self.downTimeRemaining > 0 {
            self.downTimeRemaining -= 1
        } else {
            self.downTimer.upstream.connect().cancel()
            self.game = .Press
            // start up timer
        }
    }
    
    func upTimerReceive() {
        self.upTimePassed += 1
    }
    
    func tapGesture() {
        if game == .Waiting {
            self.downTimer.upstream.connect().cancel()
            currentView = .TooFast
        } else if game == .Press {
            // stop up timer
            // navigate to result(time)
            self.currentView = .Result
        }
    }
}

struct PlayGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
