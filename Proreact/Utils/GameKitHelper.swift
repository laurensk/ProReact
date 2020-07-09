//
//  GameCenterUtils.swift
//  Proreact
//
//  Created by Laurens on 09.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation
import UIKit
import GameKit

open class GameCenterUtils: NSObject,  ObservableObject,  GKGameCenterControllerDelegate  {
    public var authenticationViewController: UIViewController?
    public var lastError: Error?
    
    
    private static let _singleton = GameCenterUtils()
    public class var sharedInstance: GameCenterUtils {
        return GameCenterUtils._singleton
    }
    
    private override init() {
        super.init()
    }
    @Published public var enabled :Bool = false
    
    public var  gameCenterEnabled : Bool {
        return GKLocalPlayer.local.isAuthenticated }
    
    public func authenticateLocalPlayer() {
        let rootVC = UIApplication.shared.windows.first?.rootViewController
        let localPlayer: GKLocalPlayer = GKLocalPlayer.local
        
        localPlayer.authenticateHandler = {(ViewController, error) -> Void in
            if((ViewController) != nil) {
                rootVC?.present(ViewController!, animated: true, completion: nil)
            } else if (localPlayer.isAuthenticated) {
                localPlayer.loadDefaultLeaderboardIdentifier(completionHandler: { (leaderboardIdentifer, error) in
                    if error == nil {
                        print("[GAME-CENTER]: Local player authenticated")
                    } else {
                        print("[GAME-CENTER]: Local player could not be authenticated!")
                    }
                })
            } else {
                print("[GAME-CENTER]: Local player could not be authenticated!")
            }
        }
    }
    
    public var gameCenterViewController : GKGameCenterViewController? { get {
        
        guard gameCenterEnabled else {
            print("[GAME-CENTER]: Local player is not authenticated")
            return nil }
        
        let gameCenterViewController = GKGameCenterViewController()
        gameCenterViewController.leaderboardIdentifier = "com.laurensk.Proreact.h_debug_01"
        gameCenterViewController.gameCenterDelegate = self
        gameCenterViewController.viewState = .leaderboards
        
        return gameCenterViewController
        }}
    
    open func gameCenterViewControllerDidFinish(_
        gameCenterViewController: GKGameCenterViewController) {
        
        gameCenterViewController.dismiss(
            animated: true, completion: nil)
    }
    
}
