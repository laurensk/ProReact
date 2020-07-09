//
//  HighscoreUtils.swift
//  Proreact
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation
import GameKit

public class HighscoreUtils {
    
    static let hu = HighscoreUtils()
    
    let localPlayer: GKLocalPlayer
    let leaderboardIdentifier: String
    
    init() {
        self.localPlayer = GKLocalPlayer.local
        self.leaderboardIdentifier = "com.laurensk.Proreact.h_debug_01"
    }
    
    // MARK: - HIGHSCORE VIEW HELPERS
    
    public func getHighscoreString() -> String {
        let highscore = getHighscore()
        if highscore <= 0 {
            return "-"
        } else {
            return "\(highscore) ms"
        }
    }
    
    public func checkForHighscore(ms: Int) {
        if ms < getHighscore() || getHighscore() <= 0 {
            setHighscore(ms: ms)
        }
    }
    
    // MARK: - HIGHSCORE LOGIC
    
    private func getHighscore() -> Int {
        
        if isGameCenter() {
            setLowerHighscore()
        }
        
        if let highscore = getLocalHighscore() {
            return highscore
        } else {
            return 0
        }
    }
    
    private func setHighscore(ms: Int) {
        setLocalHighscore(ms: ms)
        if isGameCenter() {
            setGameCenterHighscore(ms: ms)
        }
    }
    
    private func setLowerHighscore() {
        let local = getLocalHighscore()
        
        getGameCenterHighscore(completion: { gamecenter in
            
            if local == nil && gamecenter == nil { return }
            if local == nil && gamecenter != nil { self.setLocalHighscore(ms: gamecenter!); return }
            if local != nil && gamecenter == nil { self.setGameCenterHighscore(ms: local!); return }
            
            if local != nil && gamecenter != nil {
                if local! < gamecenter! {
                    self.setGameCenterHighscore(ms: local!)
                } else if gamecenter! < local! {
                    self.setLocalHighscore(ms: gamecenter!)
                }
            }
            
        })
    }
    
    
    // MARK: - LOCAL GET/SET
    
    private func getLocalHighscore() -> Int? {
        let defaults = UserDefaults.standard
        let highscore = defaults.integer(forKey: "highscore")
        if highscore <= 0 { return nil }
        return highscore
    }
    
    private func setLocalHighscore(ms: Int) {
        let defaults = UserDefaults.standard
        defaults.set(ms, forKey: "highscore")
    }
    
    // MARK: - GAME CENTER GET/SET
    
    private func getGameCenterHighscore(completion: @escaping (Int?) -> ()) {
        
        let leaderboard = GKLeaderboard()
        leaderboard.identifier = self.leaderboardIdentifier
        leaderboard.loadScores(completionHandler: { scores, error in
            if let localPlayerScore = leaderboard.localPlayerScore?.value {
                completion(Int(localPlayerScore))
            } else {
                completion(nil)
            }
        })
    }
    
    private func setGameCenterHighscore(ms: Int) {
        let gcScore = GKScore(leaderboardIdentifier: self.leaderboardIdentifier)
        gcScore.value = Int64(ms)
        GKScore.report([gcScore]) { (error) in
            if error == nil {
                print("[GAME-CENTER]: Saved successfullly!")
            } else {
                print("[GAME-CENTER]: Error saving score.")
            }
        }
    }
    
    // MARK: - GAME CENTER HELPERS
    
    private func isGameCenter() -> Bool {
        return GameCenterUtils.sharedInstance.gameCenterEnabled
    }
    
}
