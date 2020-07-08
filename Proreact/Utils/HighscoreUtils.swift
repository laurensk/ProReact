//
//  HighscoreUtils.swift
//  Proreact
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation

public class HighscoreUtils {
    
    static let hu = HighscoreUtils()
    
    public func getHighscore() -> String {
        let highscore = getHighscoreInt()
        if highscore <= 0 {
            return "-"
        } else {
            return "\(highscore) ms"
        }
    }
    
    public func getHighscoreInt() -> Int {
        if Settings.getSetting(setting: .SyncHighscoreWithiCloud) {
            return getiCloudHighscore()
        } else {
            return getLocalHighscore()
        }
        
    }
    
    public func setHighscore(ms: Int) {
        if Settings.getSetting(setting: .SyncHighscoreWithiCloud) {
            setiCloudHighscore(ms: ms)
        }
        setLocalHighscore(ms: ms)
    }
    
    public func checkForHighscore(ms: Int) {
        if ms < getHighscoreInt() || getHighscoreInt() <= 0 {
            setHighscore(ms: ms)
        }
    }
    
    private func getLocalHighscore() -> Int {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: "highscore")
    }
    
    private func setLocalHighscore(ms: Int) {
        let defaults = UserDefaults.standard
        defaults.set(ms, forKey: "highscore")
    }
    
    private func getiCloudHighscore() -> Int {
        let icloudDefaults = NSUbiquitousKeyValueStore()
        let icloudHighscore = Int(icloudDefaults.longLong(forKey: "highscore"))
        
        let localHighscore = getLocalHighscore()
        
        if localHighscore > 0 {
            if icloudHighscore < localHighscore {
                setLocalHighscore(ms: icloudHighscore)
            } else if localHighscore < icloudHighscore {
                setiCloudHighscore(ms: localHighscore)
            }
        } else {
            setLocalHighscore(ms: icloudHighscore)
        }
        return icloudHighscore
    }
    
    private func setiCloudHighscore(ms: Int) {
        let icloudDefaults = NSUbiquitousKeyValueStore()
        icloudDefaults.set(CLongLong(ms), forKey: "highscore")
        icloudDefaults.synchronize()
    }
    
}
