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
        VStack {
            Text("That was a bit too early...")
            Button(action: {
                self.currentView = .Game
            }) {
                Text("Play Again!")
            }
        }
    }
}

struct PlayzTooFastView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
