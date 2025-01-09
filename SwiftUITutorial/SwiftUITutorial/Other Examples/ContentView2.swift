//
//  ContentView2.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 18.12.2024.
//

import SwiftUI

struct ContentView2: View {
    //@State private var model = PetStoreStruct() //@State for value type like structs, Int ..
    @StateObject private var model = PetStoreClass() // @StateObject for reference type like Class
    
    var body: some View {
        
        Button("Add Pet") {
            model.myPets.append(Pet("Chirpy", kind: .bug, trick: "Canon in D", profileImage: "Chirpy", favoriteColor: .orange))
        }
        .buttonStyle(.borderedProminent)
        
        List(model.myPets) { pet in
            PetRowView(pet: pet)
        }
    }
}

#Preview {
    ContentView2()
}
