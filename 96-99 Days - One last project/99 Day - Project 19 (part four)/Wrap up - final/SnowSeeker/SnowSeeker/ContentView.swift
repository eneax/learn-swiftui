//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Enea Xharja on 23.05.25.
//

import SwiftUI

enum SortType {
    case `default`, alphabetical, country
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @State private var searchText = ""
    @State private var favorites = Favorites()
    @State private var sortType = SortType.default
    @State private var showingSortOptions = false
    @State private var showFavoritesOnly = false
    
    var filteredResorts: [Resort] {
        var result = resorts
        
        if searchText.isEmpty == false {
            result = result.filter { $0.name.localizedStandardContains(searchText) }
        }

        if showFavoritesOnly {
            result = result.filter { favorites.contains($0) }
        }

        return result
    }

    
    var sortedResults: [Resort] {
        switch sortType {
        case .default:
            filteredResorts
        case .alphabetical:
            filteredResorts.sorted { $0.name < $1.name }
        case .country:
            filteredResorts.sorted { $0.country < $1.country }
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(sortedResults) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(.rect(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.thinMaterial, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.red)
                                .accessibilityLabel("This is a favorite resort")
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingSortOptions = true
                    } label: {
                        Label("Change Sort Order", systemImage: "arrow.up.arrow.down")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showFavoritesOnly.toggle()
                    } label: {
                        Label(
                            "Filter Favorites",
                            systemImage: showFavoritesOnly 
                            ? "line.3.horizontal.decrease.circle.fill"
                            : "line.3.horizontal.decrease.circle"
                        )
                    }
                }
            }
            .confirmationDialog("Sort Order", isPresented: $showingSortOptions) {
                Button("Default") { sortType = .default }
                Button("Alphabetical") { sortType = .alphabetical }
                Button("By Country") { sortType = .country }
            }
        } detail: {
            WelcomeView()
        }
        .environment(favorites)
    }
}

#Preview {
    ContentView()
}
