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
                AddButton(viewModel: viewModel)
                Section(header: Text("My Pets"),footer: FooterView()) {
                    ForEach(viewModel.myPets) { pet in
                        row(pet: pet)
                    }
                    Text("\(viewModel.myPets.count) Pets")
                        .foregroundStyle(.secondary)
                }
                Section("Other Pets") {
                    ForEach(viewModel.otherPets) { pet in
                        row(pet: pet)
                    }
                    Text("\(viewModel.otherPets.count) Pets")
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Pet APP")
            .searchable(text: $viewModel.searchText)
        }
        
    }
    
    private func row(pet: Pet) -> some View {
        NavigationLink(destination: Text(pet.name)) {
            PetRowView(pet: pet)
                .swipeActions(edge: .leading) {
                    Button("Reward", systemImage: "trophy") {
                        pet.giveAward()
                    }
                    .tint(.orange)
                }
        }
    }
}

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

#Preview {
    PetListView()
}

struct AddButton: View {
    let viewModel: PetStoreViewModel
    
    var body: some View {
        HStack {
            Spacer()
            Button("Add Pet") {
                viewModel.petStore.myPets.append(Pet("Chirpy", kind: .bug, trick: "Canon in D", profileImage: "Chirpy", favoriteColor: .orange))
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
    }
}

struct FooterView: View {
    var body: some View {
        Text("You can add a pet by the button above.")
            .font(.footnote)
            .foregroundStyle(.secondary)
    }
}
