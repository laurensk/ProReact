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
        VStack {
            Button(action: {
                self.currentView = .Game
            }) {
                Text("Start Game")
            }
        }
    }
}

struct PlayIdleView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
