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
        VStack {
            Text("\(milliseconds)ms")
            Button(action: {
                self.currentView = .Game
            }) {
                Text("Play Again!")
            }
        }
    }
}

struct PlayResultView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
