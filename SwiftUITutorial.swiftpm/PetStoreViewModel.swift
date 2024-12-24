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
}
