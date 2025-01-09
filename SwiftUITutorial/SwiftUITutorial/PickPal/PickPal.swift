//
//  PickPal.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 8.01.2025.
//

import SwiftUI

struct PickPal: View {
    @State private var names: [String] = ["Elisha", "Andre", "Jasmine", "Po-Chun"]
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    var body: some View {
        VStack {
            
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)

                Text("Pick-a-Pal")
            }
            //.bold() iOS 16
            //.fontWeight(.bold) iOS 16
            .font(.title.bold())
            //.font(.title.weight(.bold))
            //.font(.system(size: 30, weight: .bold))

            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2.bold())
                .foregroundStyle(.tint)
            
            List {
                ForEach(names, id: \.description) { name in
                    Text(name)
                }
            }
            .cornerRadius(15)
            //.clipShape(.rect(cornerRadius: 15))
            //.clipShape(RoundedRectangle(cornerRadius: 15))
            
            TextField("Add Name", text: $nameToAdd)
                .padding(.bottom, 10)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            
            Divider()
            
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
            
            Button {
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    if shouldRemovePickedName {
                        names.removeAll { $0 == randomName }
                    }
                } else {
                    pickedName = ""
                }
            } label: {
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    PickPal()
}
