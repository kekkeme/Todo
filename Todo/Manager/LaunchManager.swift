//
//  LaunchManager.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//

import Foundation
import IQKeyboardManagerSwift

class LaunchManager {
    
    static let shared = LaunchManager()
    
    private init() {}
    
    // MARK: Configuration
    func configure() {
        RealmConfigurator.configure()
        IQKeyboardManager.shared.enable = true
        
    }
}
