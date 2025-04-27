//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Enea Xharja on 26.04.25.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    let asyncImageURL = "http://hws.dev/img/cupcakes@3x.jpg"
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: asyncImageURL), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)

                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order", action: {})
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    CheckoutView(order: Order())
}
