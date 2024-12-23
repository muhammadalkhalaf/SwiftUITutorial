//
//  PetListView.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 21.12.2024.
//

import SwiftUI

struct PetListView: View {
    @StateObject var viewModel = PetStoreViewModel() // Or you can use @State with PetStoreViewModel as Struct
    
    var body: some View {
        NavigationView {
            List {
                Section("My Pets") {
                    ForEach(viewModel.myPets) { pet in
                        row(pet: pet)
                    }
                }
                Section("Other Pets") {
                    ForEach(viewModel.otherPets) { pet in
                        row(pet: pet)
                    }
                }
            }
            .navigationTitle("Pet APP")
            .searchable(text: $viewModel.searchText)
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

class PetStoreViewModel: ObservableObject {
    var petStore = PetStoreClass()
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

#Preview {
    PetListView()
}
