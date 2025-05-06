//
//  Friend.swift
//  Friendface
//
//  Created by Enea Xharja on 06.05.25.
//

import Foundation

struct Friend: Hashable, Identifiable, Codable {
    let id: UUID
    var name: String
}
