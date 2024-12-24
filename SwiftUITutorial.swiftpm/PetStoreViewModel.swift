//
//  PetStoreViewModel.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 24.12.2024.
//

import Foundation

class PetStoreViewModel: ObservableObject {
    @Published var petStore = PetStoreStruct()
    @Published var searchText: String = ""
    
    var myPets: [Pet] {
        // For illustration purposes only. The filtered pets should be cached.
        petStore.myPets.filter { searchText.isEmpty || $0.name.contains(searchText) }
    }
    var otherPets: [Pet] {
        // For illustration purposes only. The filtered pets should be cached.
        petStore.otherPets.filter { searchText.isEmpty || $0.name.contains(searchText) }
    }
    
    func addNewPet() {
        petStore.myPets.append(Pet("Chirpy", kind: .bug, trick: "Canon in D", profileImage: "Chirpy", favoriteColor: .orange))
    }
    
    func removePet(_ id: any Hashable) {
        petStore.myPets.removeAll(where: {$0.id == id as! UUID})
        petStore.otherPets.removeAll(where: {$0.id == id as! UUID})
    }
}
