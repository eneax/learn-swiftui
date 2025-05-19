//
//  ContentView.swift
//  BucketList
//
//  Created by Enea Xharja on 12.05.25.
//

import MapKit
import SwiftUI

struct IconButton: View {
    let systemImageName: String
    let fontSize: CGFloat
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemImageName)
                .font(.system(size: fontSize, weight: .medium))
                .frame(width: 44, height: 44)
                .foregroundStyle(.primary)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .strokeBorder(.secondary.opacity(0.3), lineWidth: 0.5)
                )
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
        }
    }
}

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
            ZStack(alignment: .topTrailing) {
                MapReader { proxy in
                    Map(initialPosition: startPosition) {
                        ForEach(viewModel.locations) { location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "star.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.red.gradient)
                                    .frame(width: 32, height: 32)
                                    .padding(4)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                                    .overlay(Circle().stroke(.red.gradient, lineWidth: 1.5))
                                    .simultaneousGesture(
                                        LongPressGesture(minimumDuration: 1).onEnded { _ in
                                            viewModel.selectedPlace = location
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
                
                VStack(spacing: 12) {
                    IconButton(systemImageName: mapStyle == "standard" ? "map" : "globe.europe.africa.fill", fontSize: 22) {
                        mapStyle = (mapStyle == "standard") ? "hybrid" : "standard"
                    }

                    IconButton(systemImageName: "list.bullet", fontSize: 22) {
                        viewModel.isShowingLocationsSheet = true
                    }
                }
                .padding(.top, 60)
                .padding(.trailing)
            }
            .sheet(isPresented: $viewModel.isShowingLocationsSheet) {
                LocationsListView(
                    locations: viewModel.locations,
                    onDelete: viewModel.delete
                )
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
