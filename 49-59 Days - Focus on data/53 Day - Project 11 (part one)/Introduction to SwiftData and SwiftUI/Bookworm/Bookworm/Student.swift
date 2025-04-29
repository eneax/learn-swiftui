//
//  Student.swift
//  Bookworm
//
//  Created by Enea Xharja on 29.04.25.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
