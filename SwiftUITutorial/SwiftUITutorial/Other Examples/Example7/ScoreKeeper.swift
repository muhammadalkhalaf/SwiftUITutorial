//
//  ScoreKeeper.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 9.01.2025.
//

import SwiftUI

struct ScoreKeeper: View {
    @State private var scoreboard = Scoreboard()
    @State private var startingPoints = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Score Keeper")
                .font(.title.bold())
                .padding(.bottom)
            
            SettingsView(doesHighestScoreWin: $scoreboard.doesHighestScoreWin, startingPoints: $startingPoints)
                .disabled(scoreboard.state != .setup)
            
            if #available(iOS 16.0, *) {
                Grid {
                    GridRow {
                        Text("Player")
                            .gridColumnAlignment(.leading)
                        Text("Score")
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                    }
                    .font(.headline)
                    ForEach($scoreboard.players) { $player in
                        GridRow {
                            HStack {
                                if scoreboard.winners.contains(player) {
                                    Image(systemName: "crown.fill")
                                        .foregroundStyle(Color.yellow)
                                }
                                TextField("Name", text: $player.name)
                                    .textFieldStyle(.roundedBorder)
                                    .disabled(scoreboard.state != .setup)
                            }
                            Text("\(player.score)")
                                .opacity(scoreboard.state == .setup ? 0 : 1.0)
                            Stepper("\(player.score)", value: $player.score)
                                .labelsHidden()
                                .border(.yellow)
                                .opacity(scoreboard.state == .setup ? 0 : 1.0)
                            
                        }
                    }
                }
                .padding(.vertical)
                
            }
            
            Button("Add Player", systemImage: "plus") {
                withAnimation(.easeIn(duration: 1)) {
                    scoreboard.players.append(Player(name: "", score: 0))
                }
            }
            .opacity(scoreboard.state == .setup ? 1.0 : 0)
            
            Spacer()
            
            HStack {
                Spacer()
                switch scoreboard.state {
                case .setup:
                    Button("Start Game", systemImage: "play.fill") {
                        scoreboard.state = .playing
                        scoreboard.resetScores(to: startingPoints)
                    }
                case .playing:
                    Button("End Game", systemImage: "stop.fill") {
                        scoreboard.state = .gameOver
                    }
                case .gameOver:
                    Button("Reset Game", systemImage: "arrow.counterclockwise") {
                        scoreboard.state = .setup
                    }
                }
                Spacer()
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .tint(.blue)            
        }
        .padding()
    }
}
#Preview {
    ScoreKeeper()
}
