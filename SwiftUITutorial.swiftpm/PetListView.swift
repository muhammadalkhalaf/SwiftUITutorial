//
//  PetListView.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 21.12.2024.
//

import SwiftUI

struct PetListView: View {
    var viewModel = PetStoreViewModel()
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Section("My Pets") {
                    ForEach(viewModel.myPets(searchText: searchText)) { pet in
                        row(pet: pet)
                    }
                }
                Section("Other Pets") {
                    ForEach(viewModel.otherPets(searchText: searchText)) { pet in
                        row(pet: pet)
                    }
                }
            }
            .navigationTitle("Pet APP")
            .searchable(text: $searchText)
        }
        
    }
    
    private func row(pet: Pet) -> some View {
        PetRowView(pet: pet)
            .swipeActions(edge: .leading) {
                Button("Reward", systemImage: "trophy") {
                    pet.giveAward()
                }
                .tint(.orange)
            }
    }
}

class PetStoreViewModel {
    var petStore = PetStoreClass()
    
    func myPets(searchText: String) -> [Pet] {
        // For illustration purposes only. The filtered pets should be cached.
        petStore.myPets.filter { searchText.isEmpty || $0.name.contains(searchText) }
    }
    func otherPets(searchText: String) -> [Pet] {
        // For illustration purposes only. The filtered pets should be cached.
        petStore.otherPets.filter { searchText.isEmpty || $0.name.contains(searchText) }
    }
}

#Preview {
    PetListView()
}
