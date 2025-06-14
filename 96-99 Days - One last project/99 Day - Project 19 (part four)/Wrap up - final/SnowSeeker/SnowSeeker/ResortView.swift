//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Enea Xharja on 23.05.25.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(Favorites.self) var favorites
    
    @State private var selectedFacility: Facility?
    @State private var showingFacility = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ZStack {
                    Image(decorative: resort.id)
                        .resizable()
                        .scaledToFit()
                    
                    VStack {
                        HStack {
                            Text(resort.imageCredit)
                                .font(.caption)
                                .foregroundStyle(.white)
                                .padding(8)
                                .background(
                                    .black.opacity(0.6),
                                    in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                                )
                                .padding([.top, .leading], 15)
                            
                            Spacer()
                        }
                        
                        Spacer()
                    }

                    VStack {
                        HStack {
                            Spacer()
                            
                            Button {
                                if favorites.contains(resort) {
                                    favorites.remove(resort)
                                } else {
                                    favorites.add(resort)
                                }
                            } label: {
                                Image(systemName: favorites.contains(resort) ? "heart.fill" : "heart")
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.red, .white)
                                    .font(.system(size: 22, weight: .bold))
                                    .padding(12)
                                    .background(.ultraThinMaterial, in: Circle())
                                    .shadow(radius: 4)
                            }
                            .padding([.top, .trailing], 12)
                        }
                        
                        Spacer()
                    }
                }
                
                Group {
                    if horizontalSizeClass == .compact && dynamicTypeSize > .large {
                        VStack(spacing: 16) {
                            ResortDetailsView(resort: resort)
                            Divider()
                            SkiDetailsView(resort: resort)
                        }
                    } else {
                        HStack(spacing: 16) {
                            ResortDetailsView(resort: resort)
                            Divider()
                            SkiDetailsView(resort: resort)
                        }
                    }
                }
                .padding()
                .background(
                    .ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 20, style: .continuous)
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                )
                .padding(.horizontal)
                .padding(.top, -35)
                
                Group {
                    Text(resort.description)
                        .padding(.vertical)
                }
                .padding(.horizontal)
                
                Group {
                    Text("Facilities")
                        .font(.headline)
                    
                    LazyVGrid(
                        columns: [
                            GridItem(.adaptive(minimum: 60), spacing: 20)
                        ],
                        spacing: 16
                    ) {
                        ForEach(resort.facilityType) { facility in
                            Button {
                                selectedFacility = facility
                                showingFacility = true
                            } label: {
                                VStack(spacing: 6) {
                                    facility.icon
                                        .font(.title2)
                                        .padding(10)
                                        .background(.ultraThinMaterial, in: Circle())
                                    
                                    Text(facility.name)
                                        .font(.caption2.bold())
                                        .multilineTextAlignment(.center)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding()
                    .background(
                        .ultraThinMaterial,
                        in: RoundedRectangle(cornerRadius: 20, style: .continuous)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                }
                .padding([.horizontal, .bottom])
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(
            selectedFacility?.name ?? "More information",
            isPresented: $showingFacility,
            presenting: selectedFacility
        ) { _ in
        } message: { facility in
            Text(facility.description)
        }
    }
}

#Preview {
    ResortView(resort: .example)
        .environment(Favorites())
}
