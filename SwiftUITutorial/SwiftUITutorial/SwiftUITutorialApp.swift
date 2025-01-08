//
//  SwiftUITutorialApp.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 8.01.2025.
//

import SwiftUI

@main
struct SwiftUITutorialApp: App {
    var body: some Scene {
        WindowGroup {
            PetListView()
        }
    }
}

#Preview {
    PetListView()
}
