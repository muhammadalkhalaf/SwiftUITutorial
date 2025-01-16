//
//  RatingView.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 21.12.2024.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    //@Binding used only for value type like structs, Int ..
    //instead of @Binding we can use @ObservedObject with Rating class type (like pet in PetRowView)
    //@State will not pass changes to the parent view.(Because of this we use @Binding)
    
    var body: some View {
        HStack {
            Spacer()
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
                    .font(.largeTitle.bold())//font size
            }
            
            Button("Increase", systemImage: "plus.circle") {
                withAnimation {
                    rating += 1
                }
            }
            .disabled(rating == 10)
            .labelStyle(.iconOnly)
            Spacer()
        }
    }
}

@available(iOS 17.0, *)
#Preview  {
    @Previewable @State var rating = 10
    RatingView(rating: $rating)
}

