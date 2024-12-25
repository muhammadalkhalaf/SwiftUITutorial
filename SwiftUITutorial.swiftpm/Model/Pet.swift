//
//  Pet.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 18.12.2024.
//

import Foundation
import SwiftUICore
import CoreTransferable

class Pet: Identifiable, ObservableObject {
    enum Kind {
        case cat
        case dog
        case fish
        case bird
        case lizard
        case turtle
        case rabbit
        case bug
        
        var systemImage: String {
            switch self {
            case .cat: return "cat.fill"
            case .dog: return "dog.fill"
            case .fish: return "fish.fill"
            case .bird: return "bird.fill"
            case .lizard: return "lizard.fill"
            case .turtle: return "tortoise.fill"
            case .rabbit: return "rabbit.fill"
            case .bug: return "ant.fill"
            }
        }
    }
    
    let id = UUID()
    var name: String
    var kind: Kind
    var trick: String
    var profileImage: String
    var favoriteColor: Color
    @Published var hasAward: Bool = false
    
    init(_ name: String, kind: Kind, trick: String, profileImage: String, favoriteColor: Color) {
        self.name = name
        self.kind = kind
        self.trick = trick
        self.profileImage = profileImage
        self.favoriteColor = favoriteColor
    }
    
    init(_ name: String, kind: Kind, trick: String, profileImage: String, favoriteColor: Color, hasAward: Bool) {
        self.name = name
        self.kind = kind
        self.trick = trick
        self.profileImage = profileImage
        self.favoriteColor = favoriteColor
        self.hasAward = hasAward
    }
    
    func giveAward() {
        self.hasAward = true
    }
}
