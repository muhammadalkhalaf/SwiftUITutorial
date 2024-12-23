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
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        RatingContainerView()
    }
}
