//
//  Result.swift
//  BucketList
//
//  Created by Enea Xharja on 12.05.25.
//

import Foundation

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Result: Codable {
    let query: Query
}
