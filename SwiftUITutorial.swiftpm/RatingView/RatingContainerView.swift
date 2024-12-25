//
//  RatingContainerView.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 21.12.2024.
//

import SwiftUI

struct RatingContainerView: View {
    @State private var rating: Int = 5
    
    var body: some View {
        if #available(iOS 16.0, *) {
            Gauge(value: Double(rating), in: 0...10) {
                Text("Rating")
            }
        }
        RatingView(rating: $rating)
            .navigationTitle("Rate Pet")
        //$ creates a two-way binding and to do that in the parent rating should be @State or @StateObject but for @StateObject we should pass value type properties.(see $viewModel.searchText in PetListView)
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        RatingContainerView()
    }
}
