//
//  TodoObject.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//

import UIKit
import RealmSwift

class TodoObject: Object {
    
    
    @objc dynamic var date: Date = Date()
    @objc dynamic var title: String = ""
    @objc dynamic var detail: String = ""
    
}
