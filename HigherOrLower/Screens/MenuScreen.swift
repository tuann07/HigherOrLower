/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Anh Tuan
  ID: 3817907
  Created  date: 25/08/2022
  Last modified: 26/08/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

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
                    
                    NavigationLink {
                        SettingScreen()
                    } label: {
                        MenuButton(text: "Settings")
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
