//
//  RandomUtils.swift
//  Proreact
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation

public class RandomUtils {
    
    public static func getRandomTime() -> Int {
        return Int.random(in: 2000 ..< 7000)
    }
    
}
