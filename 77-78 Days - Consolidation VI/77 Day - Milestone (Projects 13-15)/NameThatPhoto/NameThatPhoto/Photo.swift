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
    
    init(name: String, photoData: Data) {
        self.id = UUID()
        self.name = name
        self.photoData = photoData
    }
    
    static let example = Photo(name: "Example Photo", photoData: Data())
    
    static func <(lhs: Photo, rhs: Photo) -> Bool {
        lhs.name.lowercased() < rhs.name.lowercased()
    }
}
