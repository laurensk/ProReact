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
    @State private var backgroundColor: Color = Color.blue
    
    @State private var downTimeRemaining = RandomUtils.getRandomTime()
    @State private var downTimer = Timer.publish(every: 1/1000, on: .main, in: .common).autoconnect()
    
    @State private var upTimePassed = 0
    @State private var upTimer = Timer.publish(every: 1/1000, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            VStack {
                if game == .Waiting {
                    VStack {
                        Image(systemName: "ellipsis").resizable().scaledToFit().frame(width: 150).foregroundColor(Color.white).padding(.bottom, 40)
                        Text("Wait...").font(.system(size: 65, design: .rounded)).fontWeight(.bold).foregroundColor(Color.white).padding(.bottom, 250)
                    }
                } else {
                    VStack {
                        Image(systemName: "ellipsis").resizable().scaledToFit().frame(width: 150).foregroundColor(Color.white).padding(.bottom, 40)
                        Text("Tap!").font(.system(size: 65, design: .rounded)).fontWeight(.bold).foregroundColor(Color.white).padding(.bottom, 250)
                    }
                }
            }
            HighscoreView()
        }.onReceive(downTimer) { _ in
            self.downTimerReceive()
        }.onReceive(upTimer) { _ in
            self.upTimerReceive()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(game == .Waiting ? Color("waitingColor") : Color("tapColor")).edgesIgnoringSafeArea(.all)
            .highPriorityGesture(TapGesture().onEnded({ _ in self.tapGesture() }))
            .onAppear {
                self.downTimeRemaining = RandomUtils.getRandomTime()
        }
    }
    
    func downTimerReceive() {
        if self.downTimeRemaining > 0 {
            self.downTimeRemaining -= 1
        } else {
            self.downTimer.upstream.connect().cancel()
            HapticTouchUtil.vibrateTap()
            self.game = .Press
            // start up timer
            self.upTimePassed = 0
        }
    }
    
    func upTimerReceive() {
        self.upTimePassed += 1
    }
    
    func tapGesture() {
        if game == .Waiting {
            self.downTimer.upstream.connect().cancel()
            HapticTouchUtil.vibrate(style: .light)
            currentView = .TooFast
        } else if game == .Press {
            // stop up timer
            self.upTimer.upstream.connect().cancel()
            self.milliseconds = self.upTimePassed
            HighscoreUtils.checkForHighscore(ms: self.milliseconds)
            HapticTouchUtil.vibrate(style: .light)
            self.currentView = .Result
        }
    }
}

struct PlayGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
