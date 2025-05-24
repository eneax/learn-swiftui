//
//  EmptyPhotosView.swift
//  NameThatPhoto
//
//  Created by Enea Xharja on 15.05.25.
//

import PhotosUI
import SwiftUI

struct EmptyPhotosView: View {
    @Binding var selectedPhoto: PhotosPickerItem?
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image(systemName: "photo.on.rectangle.angled")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundStyle(.secondary)
            
            Text("No Photos")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Tap the button below to add your first photo.")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
            
            PhotosPicker(selection: $selectedPhoto, matching: .images) {
                Label("Add Photo", systemImage: "plus")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.accentColor.gradient)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
            
            Spacer()
            Spacer()
        }
        .padding()
        .navigationTitle("Name That Photo")
    }
}

#Preview {
    EmptyPhotosView(selectedPhoto: .constant(nil))
}
