//
//  College.swift
//  College Profile Builder
//
//  Created by David Kirson on 7/16/17.
//  Copyright © 2017 David Kirson. All rights reserved.
//

import UIKit

class College: NSObject
{
    var name = String()
    var location = String()
    var enrollment = Int()
    var image = Data()
    
    convenience init(name: String, location: String, enrollment: Int, image: Data) {
        self.init()
        self.name = name
        self.location = location
        self.enrollment = enrollment
        self.image = image
    }
}
