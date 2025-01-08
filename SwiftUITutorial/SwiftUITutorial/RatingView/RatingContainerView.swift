//
//  RatingContainerView.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 21.12.2024.
//

import SwiftUI

struct RatingContainerView: View {
    //@State private var rating: Int = 5
    @SceneStorage("rating") private var rating: Int = 5
    //@SceneStorage will store the value locally and it acts just like @State
    //Each Scene has its own notion of SceneStorage, so data is not shared between scenes.
    //If the Scene is explicitly destroyed (the switcher snapshot is destroyed on iPadOS or the window is closed on macOS), the data is also destroyed, but on iOS data will be not destroyed for all cases.

    @AppStorage("test1") private var test1 = true
    @AppStorage("test2") private var test2 = true
    //@AppStorage reflects a value from UserDefaults, data is shared between scenes.
    
    var body: some View {
        Form {
            Toggle(isOn: $test1) {
                Text("Test 1")
            }
            
            Toggle(isOn: $test2) {
                Text("Test 2")
            }
            if #available(iOS 16.0, *) {
                Gauge(value: Double(rating), in: 0...10) {
                    HStack {
                        Text("Rating")
                        Spacer()
                    }
                }
            }
            RatingView(rating: $rating)
                .buttonStyle(.borderless)//for click event
                .navigationTitle("Rate Pet")
            //$rating creates a two-way binding and to do that in the parent rating should be @State or @StateObject but for @StateObject we should pass value type properties.(see $viewModel.searchText in PetListView)
        }
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        RatingContainerView()
    }
}
