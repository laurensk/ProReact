//
//  HighscoreView.swift
//  Proreact
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct HighscoreView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Highscore:").fontWeight(.semibold).foregroundColor(Color.white).lineLimit(1)
                Text("\(HighscoreUtils.getHighscore())").fontWeight(.bold).foregroundColor(Color.white).lineLimit(1)
            }.padding(.bottom, 140)
        }
    }
}

struct HighscoreView_Previews: PreviewProvider {
    static var previews: some View {
        HighscoreView()
    }
}
