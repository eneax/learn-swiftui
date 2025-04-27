//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Enea Xharja on 26.04.25.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    
    var body: some View {
        Text("Checkout")
    }
}

#Preview {
    CheckoutView(order: Order())
}
