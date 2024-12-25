//
//  PetStoreViewModel.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 24.12.2024.
//

import SwiftUI

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
    
    func moveMyPet(from: IndexSet, to: Int) {
        withAnimation {
            petStore.myPets.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func moveOtherPet(from: IndexSet, to: Int) {
        withAnimation {
            petStore.otherPets.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func addNewPet() {
        withAnimation {
            petStore.myPets.append(Pet("Chirpy", kind: .bug, trick: "Canon in D", profileImage: "Chirpy", favoriteColor: .orange))
        }
    }
    
//    func removePet(_ id: any Hashable) {
//        withAnimation {
//            petStore.myPets.removeAll(where: {$0.id == id as! UUID})
//            petStore.otherPets.removeAll(where: {$0.id == id as! UUID})
//        }
//    }
    
    func deleteMyPets(offsets: IndexSet) {
        withAnimation {
            petStore.myPets.remove(atOffsets: offsets)
        }
    }
    
    func deleteOtherPets(offsets: IndexSet) {
        withAnimation {
            petStore.otherPets.remove(atOffsets: offsets)
        }
    }
}
