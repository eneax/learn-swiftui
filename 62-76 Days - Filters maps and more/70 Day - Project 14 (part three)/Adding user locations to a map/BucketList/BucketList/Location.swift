//
//  Location.swift
//  BucketList
//
//  Created by Enea Xharja on 12.05.25.
//

import Foundation

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}
