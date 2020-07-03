//
//  HistoryView.swift
//  Proreact
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("History is loading...")
                    Text("Or it may not be coded yet!")
                }
            }.navigationBarTitle("History")
                .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
