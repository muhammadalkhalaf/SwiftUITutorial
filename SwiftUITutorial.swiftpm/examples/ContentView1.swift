//
//  ContentView1.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 18.12.2024.
//
import SwiftUI

struct ContentView1: View {
    @State private var model = PetStoreStruct()

    var body: some View {
        Button("Add Pet") {
            model.otherPets.append(Pet("Chirpy", kind: .bug, trick: "Canon in D", profileImage: "Chirpy", favoriteColor: .orange))
        }
        .buttonStyle(.borderedProminent)

        List(model.otherPets) { pet in
            HStack {
                Label(pet.name, systemImage: pet.kind.systemImage)
                    
                Spacer()

                Text(pet.trick)
                    .font(.system(size: 16))
            }
        }
    }
}

#Preview {
    ContentView1()
}
