//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Enea Xharja on 28.04.25.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
