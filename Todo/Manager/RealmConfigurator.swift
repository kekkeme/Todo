//
//  RealmConfigurator.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//


import Foundation
import RealmSwift

class RealmConfigurator {
    
    private init() {}
    
    // MARK: Configuration
    
    static func configure() {
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        let config = Realm.Configuration(
            schemaVersion: 1,

            migrationBlock: { migration, oldSchemaVersion in
                
                if oldSchemaVersion < 1 {
                   
                }
    
            }
        )
        
        Realm.Configuration.defaultConfiguration = config
    }
}
