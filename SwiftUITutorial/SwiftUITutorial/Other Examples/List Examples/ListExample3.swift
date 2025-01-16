//
//  ListExample3.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 19.12.2024.
//

import SwiftUI
import Observation

struct ListExample3: View {
    private var model = PetStoreStruct()

    var body: some View {
        List {
            Section("My Pets") {
                ForEach(model.myPets) { pet in
                    PetRowView(pet: pet)
                }
            }
            Section("Other Pets") {
                ForEach(model.otherPets) { pet in
                    PetRowView(pet: pet)
                }
            }
        }
    }
}

#Preview {
    ListExample3()
}
