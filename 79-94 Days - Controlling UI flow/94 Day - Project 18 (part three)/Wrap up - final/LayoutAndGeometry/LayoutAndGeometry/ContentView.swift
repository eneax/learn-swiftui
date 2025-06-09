//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Enea Xharja on 21.05.25.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(0..<50) { index in
                        GeometryReader { proxy in
                            let minY = proxy.frame(in: .global).minY
                            let center = fullView.size.height / 2
                            let distance = abs(minY - center)
                            let percent = distance / center
                            
                            let hue = min(1, minY / fullView.size.height)
                            let rotation = (minY - center) / 5
                            let opacity = max(0.3, 1 - percent)
                            let scale = max(0.6, 1 - percent * 0.4)
                            let blur = min(10, percent * 10)
                            let xOffset = (minY - center) / 20

                            Text("Row #\(index)")
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(hue: hue, saturation: 1, brightness: 1))
                                .cornerRadius(10)
                                .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
                                .opacity(opacity)
                                .scaleEffect(scale)
                                .blur(radius: blur)
                                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                                .offset(x: xOffset)
                                .animation(.bouncy(duration: 0.3), value: minY)
                        }
                        .frame(height: 60)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
