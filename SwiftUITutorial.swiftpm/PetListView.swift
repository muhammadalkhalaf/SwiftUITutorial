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
                Section(header: Text("My Pets"),footer: footerView) {
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
            .navigationTitle("Pets List")
            .searchable(text: $viewModel.searchText)
            
            //Placeholder for iPad and on an iPhone automatically removed
            Text("Select a pet from left menu")
                .font(.largeTitle)
        }
        
    }
    
    //Variable View
    private var footerView: some View {
        Text("You can add a pet by the button above.")
            .font(.footnote)//font size
            .foregroundStyle(.secondary)//color
    }
    
    //Function View
    private func row(pet: Pet) -> some View {
        NavigationLink(destination: PetDetailView(pet: pet)) {
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

//Custom View
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
        }.background(.tint)
    }
}

#Preview {
    PetListView()
}
