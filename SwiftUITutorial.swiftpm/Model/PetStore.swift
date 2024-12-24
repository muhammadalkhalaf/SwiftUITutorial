//
//  PetStoreClass.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 19.12.2024.
//

import Foundation

class PetStoreClass: ObservableObject {
    @Published var myPets: [Pet] = [
        Pet("Roofus", kind: .dog, trick: "Home runs", profileImage: "Roofus", favoriteColor: .blue),
        Pet("Sheldon", kind: .turtle, trick: "Kickflip", profileImage: "logo_kfshrc", favoriteColor: .brown),
    ]
    
    var otherPets: [Pet] = [
        Pet("Whiskers", kind: .cat, trick: "Tightrope walking", profileImage: "Whiskers", favoriteColor: .green),
        Pet("Bubbles", kind: .fish, trick: "100m freestyle", profileImage: "Bubbles", favoriteColor: .orange),
        Pet("Mango", kind: .bird,  trick: "Basketball dunk", profileImage: "Mango", favoriteColor: .green),
        Pet("Ziggy", kind: .lizard, trick: "Parkour", profileImage: "Ziggy", favoriteColor: .purple),
        Pet("Chirpy", kind: .bug, trick: "Canon in D", profileImage: "Chirpy", favoriteColor: .orange)
    ]
}

struct PetStoreStruct {
    var myPets: [Pet] = [
        Pet("Roofus", kind: .dog, trick: "Home runs", profileImage: "Roofus", favoriteColor: .blue),
        Pet("Sheldon", kind: .turtle, trick: "Kickflip", profileImage: "Sheldon", favoriteColor: .brown),
    ]
    
    var otherPets: [Pet] = [
        Pet("Whiskers", kind: .cat, trick: "Tightrope walking", profileImage: "Whiskers", favoriteColor: .green),
        Pet("Bubbles", kind: .fish, trick: "100m freestyle", profileImage: "Bubbles", favoriteColor: .orange),
        Pet("Mango", kind: .bird,  trick: "Basketball dunk", profileImage: "Mango", favoriteColor: .green),
        Pet("Ziggy", kind: .lizard, trick: "Parkour", profileImage: "Ziggy", favoriteColor: .purple),
        Pet("Chirpy", kind: .bug, trick: "Canon in D", profileImage: "Chirpy", favoriteColor: .orange)
    ]
}
