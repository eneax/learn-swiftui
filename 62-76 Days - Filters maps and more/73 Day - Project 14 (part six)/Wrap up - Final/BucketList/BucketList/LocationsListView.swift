//
//  LocationsListView.swift
//  BucketList
//
//  Created by Enea Xharja on 13.05.25.
//

import SwiftUI

struct LocationsListView: View {
    let locations: [Location]
    let onDelete: (IndexSet) -> Void

    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(locations) { location in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(location.name)
                                .font(.headline)

                            if !location.description.isEmpty {
                                Text(location.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }

                            Text("Lat: \(location.latitude), Lon: \(location.longitude)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 4)
                    }
                    .onDelete(perform: onDelete)
                }
                .listStyle(.insetGrouped)

                if locations.isEmpty {
                    ContentUnavailableView(
                        "No Locations",
                        systemImage: "map",
                        description: Text("You haven't added any locations yet.")
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.background)
                }
            }
            .navigationTitle("All Places")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if !locations.isEmpty {
                        EditButton()
                    }
                }
            }
        }
    }
}

#Preview {
    LocationsListView(
        locations: [.example, .example, .example],
        onDelete: { _ in }
    )
}
