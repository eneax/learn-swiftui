//
//  ContentView.swift
//  BucketList
//
//  Created by Enea Xharja on 09.05.25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailureView: View {
    var body: some View {
        Text("Failed!")
    }
}

struct ContentView: View {
    enum LoadingState {
        case loading, success, failed
    }
    
    @State private var loadingState = LoadingState.loading
    
    var body: some View {
        VStack {
            switch loadingState {
            case .loading:
                LoadingView()
            case .success:
                SuccessView()
            case .failed:
                FailureView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
