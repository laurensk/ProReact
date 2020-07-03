//
//  Settings.swift
//  Proreact
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation

enum SettingProperties: String {
    case EnableHapticFeedback = "enableHapticFeedback"
    case VibrateWhenTap = "vibrateWhenTap"
}

public class Settings {
    
    static func getSetting(setting: SettingProperties) -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: "\(setting)")
        
    }
    
    static func setSetting(setting: SettingProperties, value: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: "\(setting)")
    }
    
}

