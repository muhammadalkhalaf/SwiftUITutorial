//
//  PetDetailView.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 24.12.2024.
//

import SwiftUI

struct PetDetailView: View {
    var pet: Pet
    @State private var zoomed = false
    
    var body: some View {
        List {
            if !zoomed {
                Label("\(pet.kind)", systemImage: pet.kind.systemImage)
                Text(pet.name)
                    .padding(.leading, 45.0)
                Text(pet.trick)
                    .padding(.leading, 45.0)
            }
            Image(pet.profileImage)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                        zoomed.toggle()
                    }
                }
                .overlay {
                    Rectangle().stroke(pet.favoriteColor, lineWidth: 5)
                }
        }
        .navigationTitle("Pet Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        PetDetailView(pet: Pet("Name 1",
                               kind: .cat,
                               trick: "Trick 1",
                               profileImage: "Mango",
                               favoriteColor: .black))
    }
}
