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
            
            SettingsView(doesHighestScoreWin: $scoreboard.doesHighestScoreWin,
                         startingPoints: $startingPoints)
                .disabled(scoreboard.state != .setup)
            
            if #available(iOS 16.0, *) {
                Grid {
                    GridRow {//Bu satırda her View bir column temsil eder.
                        Text("Player")//birinci column
                            //.gridColumnAlignment(.leading)
                        Text("Score")//ikinci column
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                    }
                    .font(.headline)
                    
                    //diğer satırlar dinamik bir şekilde ekliyoruz
                    ForEach($scoreboard.players) { $player in
                        GridRow {
                            HStack {//birinci column
                                //tek bir column olsun diye HStack kullandık böylece Player title ve bu HStack birbirinin altında olacak
                                if scoreboard.winners.contains(player) {
                                    Image(systemName: "crown.fill")
                                        .foregroundStyle(Color.yellow)
                                }
                                TextField("Name", text: $player.name)
                                    .textFieldStyle(.roundedBorder)
                                    .disabled(scoreboard.state != .setup)
                            }
                            Text("\(player.score)")//ikinci column
                                .opacity(scoreboard.state == .setup ? 0 : 1.0)

                            //üçüncü column
                            Stepper("\(player.score)", value: $player.score)
                                .labelsHidden()//Score title ve Score value Birbirinin altında olmak için buradaki label kaldırıp yukarıda ikinci column olarak bir text ekledik böylece ikisi (Score title ve Score value) ikinci column da yerleştirildi
                                //.border(.yellow)
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
            //.opacity(scoreboard.state == .setup ? 1.0 : 0)
            .disabled(scoreboard.state != .setup)
            .buttonStyle(.borderedProminent)
            
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
