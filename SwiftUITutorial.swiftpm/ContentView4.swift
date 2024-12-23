//
//  ContentView4.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 19.12.2024.
//

import SwiftUI

struct ContentView4: View {
    private var model = PetStoreClass()
    
    var body: some View {
        List {
            Section("My Pets") {
                ForEach(model.myPets) { pet in
                    row(pet: pet)
                }
            }
            Section("Other Pets") {
                ForEach(model.otherPets) { pet in
                    row(pet: pet)
                }
            }
        }
    }
    
    private func row(pet: Pet) -> some View {
        return PetRowView(pet: pet)
            .swipeActions(edge: .leading) {
                Button("Award", systemImage: "trophy") {
                    pet.giveAward()
                }
                .tint(.orange)
                if #available(iOS 16.0, *) {
                    ShareLink(item: pet.name, preview: SharePreview("Pet", image: Image(pet.name)))
                }
            }
    }
}

#Preview {
    ContentView4()
}
