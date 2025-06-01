//
//  ContentView.swift
//  Flashzilla
//
//  Created by Enea Xharja on 19.05.25.
//

import SwiftUI

struct ContentView: View {
    @State private var currentScaleAmount = 0.0
    @State private var finalScaleAmount = 1.0
    
    @State private var currentRotationAmount = Angle.zero
    @State private var finalRotationAmount = Angle.zero
    
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
//            Text("Double")
//                .onTapGesture(count: 2) {
//                    print("Double tapped!")
//                }
//
//            Text("Long press")
//                .onLongPressGesture(minimumDuration: 2) {
//                    print("Long pressed!")
//                } onPressingChanged: { inProgress in
//                    print("In progress \(inProgress)")
//                }
        
//            Text("Pinch")
//                .scaleEffect(finalScaleAmount + currentScaleAmount)
//                .gesture(
//                    MagnifyGesture()
//                        .onChanged { value in
//                            currentScaleAmount = value.magnification - 1
//                        }
//                        .onEnded { value in
//                            finalScaleAmount += currentScaleAmount
//                            currentScaleAmount = 0
//                        }
//                )
        
//            Text("Rotation")
//                .rotationEffect(currentRotationAmount + finalRotationAmount)
//                .gesture(
//                    RotateGesture()
//                        .onChanged { value in
//                            currentRotationAmount = value.rotation
//                        }
//                        .onEnded { value in
//                            finalRotationAmount += currentRotationAmount
//                            currentRotationAmount = .zero
//                        }
//                )
        
        // Child component has priority
//            VStack {
//                Text("Child")
//                    .onTapGesture {
//                        print("Text tapped!")
//                    }
//            }
//            .onTapGesture {
//                print("VStack tapped!")
//            }
        
        // Give priority to parent
//            VStack {
//                Text("Parent")
//                    .onTapGesture {
//                        print("Text tapped!")
//                    }
//            }
//            .highPriorityGesture(
//                TapGesture()
//                    .onEnded {
//                        print("VStack tapped!")
//                    }
//            )
        
        // Both parent and child
//            VStack {
//                Text("Child and Parent")
//                    .onTapGesture {
//                        print("Text tapped!")
//                    }
//            }
//            .simultaneousGesture(
//                TapGesture()
//                    .onEnded {
//                        print("VStack tapped!")
//                    }
//            )
        
        // Combined gesture
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { _ in
                withAnimation {
                    isDragging = true
                }
            }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }
}

#Preview {
    ContentView()
}
