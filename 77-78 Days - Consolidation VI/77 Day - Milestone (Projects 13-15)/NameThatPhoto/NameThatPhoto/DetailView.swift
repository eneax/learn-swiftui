//
//  DetailView.swift
//  NameThatPhoto
//
//  Created by Enea Xharja on 14.05.25.
//

import SwiftUI

struct DetailView: View {
    var photo: Photo
    
    var body: some View {
        VStack {
            if let uiImage = UIImage(data: photo.photoData) {
                Spacer()
                
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                    .background(.white)
                    .border(.white.opacity(0.3), width: 1)
                    .shadow(radius: 3)
                
                Spacer()
                Spacer()
            } else {
                Text("Unable to load image")
            }
        }
        .navigationTitle(photo.name)
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    let sampleImage = UIImage(systemName: "photo")!
    let imageData = sampleImage.pngData()!

    let samplePhoto = Photo(name: "Sample Photo", photoData: imageData)

    return DetailView(photo: samplePhoto)
}
