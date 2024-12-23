//
//  PetRowView.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 18.12.2024.
//

import Foundation
import SwiftUI

struct PetRowView: View {
    @ObservedObject var pet: Pet// @StateObject or @ObservedObject
    
    var body: some View {
        HStack {
            profileImage
            
            VStack(alignment: .leading) {
                HStack(alignment: .firstTextBaseline) {
                    Text(pet.name)
                    
                    if pet.hasAward {
                        Image(systemName: "trophy.fill")
                            .foregroundStyle(.orange)
                    }
                }
                Text(pet.trick)
                    .font(.subheadline)//font size for subtitle
                    .foregroundStyle(.secondary)//color for subtitle
            }
            
            Spacer()
        }
    }
    
    private var profileImage: some View {
        Image(pet.profileImage)
            .resizable()
            .clipShape(.circle)
            .shadow(radius: 3)
            .frame(width: 55, height: 55)
            .overlay {
                Circle().stroke(pet.favoriteColor, lineWidth: 2)
            }
    }
}

#Preview {
    PetRowView(pet: Pet("Name", kind: .cat, trick: "Trick", profileImage: "Mango", favoriteColor: .black))
}
