//
//  ContentView.swift
//  iTracker
//
//  Created by Enea Xharja on 19.04.25.
//

import SwiftUI

struct ContentView: View {
    @State private var data = Activities()
    @State private var addingNewActivity = false
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(data.activities) { activity in
                        NavigationLink {
                            ActivityView(data: data, activity: activity, onDelete: {
                                data.remove(activity)
                            })
                        } label: {
                            VStack {
                                VStack {
                                    Text(String(activity.completionCount))
                                        .frame(width: 145, height: 145)
                                        .padding()
                                }
                                .frame(maxWidth: .infinity)
                                .background(color(for: activity))
                                .foregroundStyle(.white)
                                .font(.title.weight(.black))
                                .clipShape(.rect(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white)
                                )

                                VStack(alignment: .leading) {
                                    Text(activity.title)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(0)
                            }
                            .padding(.horizontal, 5)
                            .padding(.vertical, 10)
                        }
                    }
                }
            }
            .navigationTitle("iTracker")
            .background(.black)
            .preferredColorScheme(.dark)
            .padding(.horizontal, 10)
            .safeAreaInset(edge: .bottom) {
                ZStack {
                    Button(action: {
                        addingNewActivity.toggle()
                    }) {
                        Image(systemName: "plus")
                            .accessibilityLabel("Add new activity")
                    }
                    .frame(width: 80, height: 80)
                    .background(.yellow)
                    .foregroundStyle(.black)
                    .font(.largeTitle.bold())
                    .clipShape(.circle)
                    .sheet(isPresented: $addingNewActivity) {
                        AddActivity(data: data)
                    }
                    .padding(.top)
                    .padding(.bottom, 50)
                }
                .frame(maxWidth: .infinity, maxHeight: 40)
                .background(.ultraThinMaterial)
            }
        }
    }
    
    func color(for activity: Activity) -> Color {
        if activity.completionCount < 3 {
            .red
        } else if activity.completionCount < 7 {
            .orange
        } else if activity.completionCount < 10 {
            .green
        } else if activity.completionCount < 15 {
            .blue
        } else {
            .indigo
        }
    }
}

#Preview {
    ContentView()
}
