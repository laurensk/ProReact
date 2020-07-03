//
//  HapticTouchUtil.swift
//  Proreact
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation
import UIKit

public class HapticTouchUtil {
    
    public static func vibrate(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        if Settings.getSetting(setting: .EnableHapticFeedback) {
            let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: style)
            impactFeedbackgenerator.prepare()
            impactFeedbackgenerator.impactOccurred()
        }
    }
    
    public static func vibrateTap() {
        if Settings.getSetting(setting: .VibrateWhenTap) {
            let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
            impactFeedbackgenerator.prepare()
            impactFeedbackgenerator.impactOccurred()
        }
    }
    
    
}
