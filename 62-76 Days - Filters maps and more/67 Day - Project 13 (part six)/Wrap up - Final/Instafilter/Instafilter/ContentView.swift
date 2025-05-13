//
//  ContentView.swift
//  Instafilter
//
//  Created by Enea Xharja on 08.05.25.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import StoreKit
import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 3.0
    @State private var filterScale = 5.0
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var showingFilters = false
    
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
    
    @State private var currentFilter: CIFilter = CIFilter.vignette()
    @State private var filterDisplayName = "Vignette"
    
    let context = CIContext()
    
    @ViewBuilder
    var photoPickerLabel: some View {
        if let processedImage {
            VStack {
                processedImage
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                    .background(.white)
                    .border(.white.opacity(0.3), width: 1)
                    .shadow(radius: 3)

                Text("\(filterDisplayName)")
                    .foregroundStyle(.secondary)
            }
        } else {
            ContentUnavailableView(
                "No picture",
                systemImage: "photo.badge.plus",
                description: Text("Tap to import a photo")
            )
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                PhotosPicker(selection: $selectedItem) {
                    photoPickerLabel
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)
                
                Spacer()
                
                if processedImage != nil {
                    VStack {
                        if currentFilter.inputKeys.contains(kCIInputIntensityKey) {
                            HStack {
                                Text("Intensity")
                                Slider(value: $filterIntensity)
                                    .onChange(of: filterIntensity, applyProcessing)
                                Text("\(Int(filterIntensity * 100))")
                            }
                        }
                        
                        if currentFilter.inputKeys.contains(kCIInputRadiusKey) {
                            HStack {
                                Text("Radius")
                                Slider(value: $filterRadius, in: 0...200)
                                    .onChange(of: filterRadius, applyProcessing)
                                Text("\(Int(filterRadius))")
                            }
                        }
                        
                        if currentFilter.inputKeys.contains(kCIInputScaleKey) {
                            HStack {
                                Text("Scale")
                                Slider(value: $filterScale, in: 0...10)
                                    .onChange(of: filterScale, applyProcessing)
                                Text("\(Int(filterScale * 100))%")
                            }
                        }
                    }
                    .padding(.vertical)
                }
                
                HStack {
                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("Instafilter image - \(filterDisplayName)", image: processedImage)) {
                            Label("", systemImage: "square.and.arrow.up")
                        }
                    }
                    
                    Spacer()
                    
                    Button("Change Filter", action: changeFilter)
                        .disabled(processedImage == nil)
                    
                    Spacer()
                    
                    if processedImage != nil {
                        Button {
                            selectedItem = nil
                            processedImage = nil
                            filterDisplayName = ""
                            currentFilter = CIFilter.vignette()
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .confirmationDialog("Select a filter", isPresented: $showingFilters) {
                Button("Crystallize") { setFilter(CIFilter.crystallize(), name: "Crystallize") }
                Button("Dither") { setFilter(CIFilter.dither(), name: "Dither") }
                Button("Pointillize") { setFilter(CIFilter.pointillize(), name: "Pointillize") }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone(), name: "Sepia Tone") }
                Button("Vignette") { setFilter(CIFilter.vignette(), name: "Vignette") }
                Button("Cancel", role: .cancel) { }
            }
        }
    }
    
    func changeFilter() {
        showingFilters = true
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterRadius, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterScale, forKey: kCIInputScaleKey) }
        
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
    
    func setFilter(_ filter: CIFilter, name: String) {
        currentFilter = filter
        filterDisplayName = name
        
        loadImage()
        
        filterCount += 1
        
        if filterCount >= 40 {
            requestReview()
        }
    }
}

#Preview {
    ContentView()
}
