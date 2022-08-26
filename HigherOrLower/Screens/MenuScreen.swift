//
//  MenuScreen.swift
//  HigherOrLower
//
//  Created by Anh Nguyen on 8/25/22.
//

import SwiftUI

struct MenuScreen: View {
    @AppStorage("coins") private var coins = 100
    @AppStorage("playingHighscore") private var playingHighscore = 100
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Blue400")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Higher Or Lower")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Blue700"))
                    
                    Spacer()
                    
                    NavigationLink {
                        GameScreen()
                    } label: {
                        MenuButton(text: "Continue")
                    }
                    
                    NavigationLink {
                        GameScreen()
                            .onAppear(perform: {
                                coins = 100
                                playingHighscore = 100
                            })
                    } label: {
                        MenuButton(text: "New Game")
                    }
                    
                    
                    NavigationLink {
                        LeaderboardScreen()
                    } label: {
                        MenuButton(text: "Leaderboard")
                    }
                    
                    NavigationLink {
                        HowToPlayScreen()
                    } label: {
                        MenuButton(text: "How To Play")
                    }
                    
                    
                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                playSound(sound: "cottagecore", type: "mp3")
            })
        }
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
    }
}
