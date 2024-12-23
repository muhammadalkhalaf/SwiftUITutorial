//
//  RatingView.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 21.12.2024.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            Button("Decrease", systemImage: "minus.circle") {
                withAnimation{
                    rating -= 1
                }
            }
            .disabled(rating == 0)
            .labelStyle(.iconOnly)

            if #available(iOS 17.0, *) {
                Text(rating, format: .number.precision(.integerLength(2)))
                    .font(.largeTitle.bold())
                    .contentTransition(.numericText(value: Double(rating)))
            } else {
                Text(rating, format: .number.precision(.integerLength(2)))
                    .font(.largeTitle.bold())
            }

            Button("Increase", systemImage: "plus.circle") {
                withAnimation {
                    rating += 1
                }
            }
            .disabled(rating == 10)
            .labelStyle(.iconOnly)
        }
    }
}
