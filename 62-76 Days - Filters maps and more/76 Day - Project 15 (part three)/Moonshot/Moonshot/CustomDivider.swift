//
//  CustomDivider.swift
//  Moonshot
//
//  Created by Enea Xharja on 15.04.25.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomDivider()
}
