//
//  PlayResultView.swift
//  Proreact
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct PlayResultView: View {
    
    @Binding var currentView: GameState
    @Binding var milliseconds: Int
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "timer").resizable().scaledToFit().frame(width: 150).foregroundColor(Color.white).padding(.bottom, 30)
                Text("\(milliseconds) ms").font(.system(size: 65, design: .rounded)).fontWeight(.bold).foregroundColor(Color.white).padding(.bottom, 200)
            }
            HighscoreView()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color("resultColor")).edgesIgnoringSafeArea(.all)
            .highPriorityGesture(TapGesture().onEnded({ _ in self.tapGesture() }))
    }
    
    func tapGesture() {
        self.currentView = .Game
    }
    
}

struct PlayResultView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
