//
//  FeatureCard.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 7.01.2025.
//

import SwiftUI

struct FeatureCard: View {
    let iconName: String
    let description: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 50)
                .padding(.trailing, 10)
            
            Text(description)
            
            Spacer()
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.blue)
                .opacity(0.25)
            //Opacity values range from 0 (fully transparent) to 1 (opaque).
                .brightness(-0.4)
            //Brightness values range from –1 to 1
        }
        .foregroundStyle(.white)
    }
}


#Preview {
    FeatureCard(iconName: "person.2.crop.square.stack.fill",
                description: "A multiline description about a feature paired with the image on the left.")
}
