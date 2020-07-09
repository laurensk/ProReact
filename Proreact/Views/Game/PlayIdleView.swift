//
//  PlayIdleView.swift
//  Proreact
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct PlayIdleView: View {
    
    @Binding var currentView: GameState
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Spacer()
                Image(systemName: "hand.draw.fill").resizable().scaledToFit().frame(width: 150).foregroundColor(Color.white).padding(.bottom, 30)
                Text("Reaction Time Test").font(.system(size: 35, design: .rounded)).fontWeight(.bold).foregroundColor(Color.white)
                Spacer()
                Spacer()
                Text("When the red screen turns green, tap as quickly as you can. Tap anywhere to start.").fontWeight(.semibold).multilineTextAlignment(.center).padding(.leading, 40).padding(.trailing, 40).foregroundColor(Color.white)
                Spacer()
                Spacer()
            }
            HighscoreView()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color("idleColor")).edgesIgnoringSafeArea(.all)
            .highPriorityGesture(TapGesture().onEnded({ _ in self.tapGesture() }))
    }
    
    func tapGesture() {
        HapticTouchUtil.vibrate(style: .light)
        self.currentView = .Game
    }
}

struct PlayIdleView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
