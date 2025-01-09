//
//  PetDetailView.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 24.12.2024.
//

import SwiftUI

struct PetDetailView: View {
    var pet: Pet
    @State private var zoomed = false
    
    var body: some View {
        VStack(spacing: 0) {
            List {
                if !zoomed {
                    Label("\(pet.kind)", systemImage: pet.kind.systemImage)
                    Text(pet.name)
                        .padding(.leading, 45.0)
                    Text(pet.trick)
                        .padding(.leading, 45.0)
                }
                Image(pet.profileImage)
                    .resizable()
                    .aspectRatio(contentMode: zoomed ? .fill : .fit)
                    .listRowInsets(EdgeInsets())
                    .scaleEffect(zoomed ? 1.5 : 1)
                    .onTapGesture {
                        withAnimation {
                            zoomed.toggle()
                        }
                    }
                    .overlay {
//                        Rectangle().stroke(pet.favoriteColor, lineWidth: 5)
                        RoundedRectangle(cornerRadius: 15).stroke(pet.favoriteColor, lineWidth: 15)

                    }
                NavigationLink(destination: RatingContainerView()){
                    HStack {
                        Spacer()
                        Text("Rate Pet")
                            .foregroundStyle(.white)
                        Spacer()
                    }
                }
                .listRowBackground(Color.green)
            }
            
            if pet.hasAward {
                HStack {
                    Spacer()
                    Label("Has Award", systemImage: "flame.fill")
                    Spacer()
                }
                .padding(.bottom)
                .padding(.top, 5)
                .font(.headline.smallCaps())
                .foregroundStyle(.white)
                .background(.orange)
            }
        }
        .navigationTitle("Pet Detail")
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    NavigationView {
        PetDetailView(pet: Pet("Name 1",
                               kind: .cat,
                               trick: "Trick 1",
                               profileImage: "Mango",
                               favoriteColor: .black,
                               hasAward: true))
    }
}
