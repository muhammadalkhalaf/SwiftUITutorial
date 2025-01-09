//
//  ScoreKeeper.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 9.01.2025.
//

import SwiftUI

struct ScoreKeeper: View {
    @State private var players: [Player] = [
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0),
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Score Keeper")
                .font(.title.bold())
                .padding(.bottom)
            
            if #available(iOS 16.0, *) {
                Grid {
                    GridRow {
                        Text("Player")
                            .gridColumnAlignment(.leading)
                        Text("Score")
                    }
                    .font(.headline)
                    ForEach($players) { $player in
                        GridRow {
                            TextField("Name", text: $player.name)
                                .textFieldStyle(.roundedBorder)
                            Text("\(player.score)")
                            Stepper("\(player.score)", value: $player.score)
                                .labelsHidden()
                                .border(.yellow)
                            
                        }
                    }
                }
                .padding(.vertical)
                
            }
            
            Button("Add Player", systemImage: "plus") {
                withAnimation(.easeIn(duration: 1)) {
                    players.append(Player(name: "", score: 0))
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ScoreKeeper()
}
