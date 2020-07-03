//
//  PlayzTooFastView.swift
//  Proreact
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct PlayzTooFastView: View {
    
    @Binding var currentView: GameState
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "clear.fill").resizable().scaledToFit().frame(width: 150).foregroundColor(Color.white).padding(.bottom, 40)
                Text("Too soon!").font(.system(size: 65, design: .rounded)).fontWeight(.bold).foregroundColor(Color.white).padding(.bottom, 250)
            }
            HighscoreView()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color("resultColor")).edgesIgnoringSafeArea(.all)
            .highPriorityGesture(TapGesture().onEnded({ _ in self.tapGesture() }))
    }
    
    func tapGesture() {
        HapticTouchUtil.vibrate(style: .light)
        self.currentView = .Game
    }
}

struct PlayzTooFastView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
