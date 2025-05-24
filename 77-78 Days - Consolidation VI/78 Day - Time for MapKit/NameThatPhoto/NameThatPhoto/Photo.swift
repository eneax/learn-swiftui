//
//  Photo.swift
//  NameThatPhoto
//
//  Created by Enea Xharja on 14.05.25.
//

import Foundation
import SwiftData

@Model
class Photo: Comparable, Identifiable {
    var id: UUID
    var name: String
    @Attribute(.externalStorage) var photoData: Data
    var latitude: Double?
    var longitude: Double?
    
    init(name: String, photoData: Data, latitude: Double? = nil, longitude: Double? = nil) {
        self.id = UUID()
        self.name = name
        self.photoData = photoData
        self.latitude = latitude
        self.longitude = longitude
    }
    
    static let example = Photo(name: "Example Photo", photoData: Data())
    
    static func <(lhs: Photo, rhs: Photo) -> Bool {
        lhs.name.lowercased() < rhs.name.lowercased()
    }
}
