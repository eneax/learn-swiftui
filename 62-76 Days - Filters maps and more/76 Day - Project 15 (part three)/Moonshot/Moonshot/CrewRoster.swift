//
//  CrewRoster.swift
//  Moonshot
//
//  Created by Enea Xharja on 15.04.25.
//

import SwiftUI

struct CrewRoster: View {
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink(value: crewMember.astronaut) {
                        VStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 144, height: 112)
                                .clipShape(.circle)
                                .overlay(
                                    Circle()
                                        .strokeBorder(.white, lineWidth: 0.5)
                                )
                            
                            VStack(alignment: .center) {
                                Text(crewMember.astronaut.name)
                                    .font(.subheadline)
                                    .foregroundStyle(.white)
                                    .accessibilityLabel(crewMember.astronaut.name.replacingOccurrences(of: ".", with: " "))
                                
                                Text(crewMember.role)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.75))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationDestination(for: Astronaut.self) { astronaut in
            AstronautView(astronaut: astronaut)
        }
    }
}

#Preview {
    CrewRoster(crew: [])
}
