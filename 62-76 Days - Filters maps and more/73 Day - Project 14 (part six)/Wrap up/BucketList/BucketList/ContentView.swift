//
//  ContentView.swift
//  BucketList
//
//  Created by Enea Xharja on 12.05.25.
//

import MapKit
import SwiftUI

struct ContentView: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 41.9028, longitude: 12.4964), // Italy
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    )
    
    @State private var viewModel = ViewModel()
    @AppStorage("mapStyle") private var mapStyle = "standard"
    
    var body: some View {
        if viewModel.isUnlocked {
            VStack {
                MapReader { proxy in // read position on map, not on screen
                    Map(initialPosition: startPosition) {
                        ForEach(viewModel.locations) { location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(.circle)
                                // .onLongPressGesture { selectedPlace = location }
                                    .simultaneousGesture(
                                        LongPressGesture(minimumDuration: 1).onEnded { _ in viewModel.selectedPlace = location
                                        }
                                    )
                            }
                        }
                    }
                    .mapStyle(mapStyle == "standard" ? .standard : .hybrid)
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            viewModel.addLocation(at: coordinate)
                        }
                    }
                    .sheet(item: $viewModel.selectedPlace) { place in
                        EditView(location: place) {
                            viewModel.update(location: $0)
                        }
                    }
                }
                
                Picker("Map mode", selection: $mapStyle) {
                    Text("Standard")
                        .tag("standard")
                    
                    Text("Hybrid")
                        .tag("hybrid")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
            }
        } else {
            Button("Unlock Places", action: viewModel.authenticate)
                .padding()
                .background(.blue.gradient)
                .foregroundStyle(.white)
                .clipShape(.capsule)
                .alert("Authentication error.", isPresented: $viewModel.isShowingAuthenticationError) {
                    Button("Ok") { }
                } message: {
                    Text(viewModel.authenticationError)
                }
        }
    }
}

#Preview {
    ContentView()
}
