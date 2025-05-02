//
//  String-EmptyChecking.swift
//  Bookworm
//
//  Created by Enea Xharja on 02.05.25.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
