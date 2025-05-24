//
//  ContentView.swift
//  NameThatPhoto
//
//  Created by Enea Xharja on 14.05.25.
//

import PhotosUI
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var photos: [Photo]
    
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var showingNamePrompt = false
    @State private var newName = ""
    @State private var newPhotoData: Data?
    @State private var locationFetcher = LocationFetcher()
    
    var body: some View {
        NavigationStack {
            if photos.isEmpty {
                EmptyPhotosView(selectedPhoto: $selectedPhoto)
            } else {
                List {
                    ForEach(photos.sorted()) { photo in
                        NavigationLink(destination: DetailView(photo: photo)) {
                            HStack {
                                if let uiImage = UIImage(data: photo.photoData) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 44, height: 44)
                                        .clipShape(.circle)
                                }
                                Text(photo.name)
                            }
                        }
                    }
                    .onDelete(perform: deletePhotos)
                }
                .navigationTitle("Name That Photo")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        PhotosPicker(selection: $selectedPhoto, matching: .images) {
                            Label("Add Photo", systemImage: "plus")
                        }
                    }
                }
            }
        }
        .onChange(of: selectedPhoto) { oldItem, newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    newPhotoData = data
                    showingNamePrompt = true
                }
            }
        }
        .alert("Enter photo name", isPresented: $showingNamePrompt) {
            TextField("Name", text: $newName)
            Button("Save", action: saveNewPhoto)
            Button("Cancel", role: .cancel, action: resetState)
        }
        .onAppear {
            locationFetcher.start()
        }
    }
    
    func saveNewPhoto() {
        guard let data = newPhotoData, newName.trimmingCharacters(in: .whitespaces).isEmpty == false else { return }
        
        let location = locationFetcher.lastKnownLocation
        
        let newPhoto = Photo(
            name: newName,
            photoData: data,
            latitude: location?.latitude,
            longitude: location?.longitude
        )
        
        modelContext.insert(newPhoto)
        resetState()
    }
    
    func resetState() {
        newName = ""
        newPhotoData = nil
        selectedPhoto = nil
    }
    
    func deletePhotos(at offsets: IndexSet) {
        let sortedPhotos = photos.sorted()
        for index in offsets {
            let photo = sortedPhotos[index]
            modelContext.delete(photo)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to save context after deletion: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
