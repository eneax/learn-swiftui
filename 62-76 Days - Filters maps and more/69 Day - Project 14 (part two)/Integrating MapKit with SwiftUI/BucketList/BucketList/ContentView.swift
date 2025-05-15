//
//  ContentView.swift
//  BucketList
//
//  Created by Enea Xharja on 10.05.25.
//

import MapKit
import SwiftUI

var london = MapCameraPosition.region(
    MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    )
)

var paris = MapCameraPosition.region(
    MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    )
)

var tokyo = MapCameraPosition.region(
    MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    )
)

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

//struct ContentView: View {
//    @State private var position = london
//    
//    var body: some View {
//        VStack {
//            Map(position: $position)
//                .mapStyle(.hybrid(elevation: .realistic))
//                .onMapCameraChange { context in
//                    print(context.region)
//                }
//            
//            HStack {
//                Button("Paris") {
//                    position = paris
//                }
//
//                Button("Tokyo") {
//                    position = tokyo
//                }
//            }
//        }
//    }
//}

struct ContentView: View {
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        VStack {
            Map {
                ForEach(locations) { location in
                    // Marker(location.name, coordinate: location.coordinate)
                    Annotation(location.name, coordinate: location.coordinate) {
                        Text(location.name)
                            .font(.headline)
                            .padding()
                            .background(.blue.gradient)
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                    }
                    .annotationTitles(.hidden)
                }
            }
            
//            MapReader { proxy in
//                Map()
//                    .onTapGesture { position in
//                        if let coordinate = proxy.convert(position, from: .local) {
//                            print(coordinate)
//                        }
//                    }
//            }
        }
    }
}

#Preview {
    ContentView()
}







let locations = [
    Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
    Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
]
