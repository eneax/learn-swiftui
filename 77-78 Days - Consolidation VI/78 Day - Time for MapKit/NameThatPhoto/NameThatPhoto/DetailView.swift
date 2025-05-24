//
//  DetailView.swift
//  NameThatPhoto
//
//  Created by Enea Xharja on 14.05.25.
//

import MapKit
import SwiftData
import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

struct DetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    var photo: Photo
    
    var coordinate: CLLocationCoordinate2D? {
        guard let lat = photo.latitude, let lon = photo.longitude else { return nil }
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
    
    @State private var showingDeleteConfirmation = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                if let uiImage = UIImage(data: photo.photoData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                } else {
                    Text("Unable to load image")
                        .foregroundColor(.secondary)
                }
            }

            VStack(spacing: 0) {
                if let coordinate = coordinate {
                    Text("Photo Location")
                        .font(.headline)
                        .padding()
                    
                    Map(position: .constant(MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: coordinate,
                            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                        )
                    ))) {
                        Annotation(photo.name, coordinate: coordinate) {
                            Text(photo.name)
                                .font(.caption)
                                .padding()
                                .background(.indigo.gradient)
                                .foregroundStyle(.white)
                                .clipShape(.capsule)
                        }
                        .annotationTitles(.hidden)
                        
                    }
                    .frame(height: 200)
                    .clipShape(RoundedCorner(radius: 10, corners: [.topLeft, .topRight]))
                    
                    Text("Coordinates: \(coordinate.latitude), \(coordinate.longitude)")
                        .foregroundColor(.secondary)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedCorner(radius: 10, corners: [.bottomLeft, .bottomRight]))
                } else {
                    Text("No location data available for this photo.")
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle(photo.name)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(role: .destructive) {
                    showingDeleteConfirmation = true
                } label: {
                    Label("Delete", systemImage: "trash")
                }
            }
        }
        .alert("Delete photo", isPresented: $showingDeleteConfirmation) {
            Button("Delete", role: .destructive, action: deletePhoto)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("This action cannot be undone.")
        }
    }
    
    func deletePhoto() {
        modelContext.delete(photo)
        do {
            try modelContext.save()
            dismiss()
        } catch {
            print("Failed to delete photo: \(error.localizedDescription)")
        }
    }
}

#Preview {
    let sampleImage = UIImage(systemName: "photo")!
    let imageData = sampleImage.pngData()!

    let samplePhoto = Photo(name: "Sample Photo", photoData: imageData)

    return DetailView(photo: samplePhoto)
}
