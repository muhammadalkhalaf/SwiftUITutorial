//
//  DiceView.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 8.01.2025.
//

import SwiftUI

struct DiceView: View {
    @State private var numberOfPips: Int = 1
    //state is owned by the view. You always mark state properties private so other views can’t interfere with their value.
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
            //The .resizable modifier tells the image it can stretch to fill any available space.
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.black, .white)

            Button("Roll") {
                withAnimation {
                    numberOfPips = Int.random(in: 1...6)
                }
            }
            .buttonStyle(.bordered)
            
        }
    }
}

#Preview {
    DiceView()
}
