//
//  HighscoreUtils.swift
//  Proreact
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation

public class HighscoreUtils {
    
    static func getHighscore() -> Int {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: "highscore")
        
    }
    
    static func setHighscore(ms: Int) {
        let defaults = UserDefaults.standard
        defaults.set(ms, forKey: "highscore")
    }
    
    static func checkForHighscore(ms: Int) {
        if ms < getHighscore() {
            setHighscore(ms: ms)
        }
    }
    
}
