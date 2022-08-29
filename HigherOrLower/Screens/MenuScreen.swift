/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Anh Tuan
  ID: 3817907
  Created  date: 25/08/2022
  Last modified: 28/08/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct MenuScreen: View {
    @AppStorage(AppStorageKeys.coins) private var coins = DefaultValues.coins
    @AppStorage(AppStorageKeys.playingHighscore) private var playingHighscore = DefaultValues.coins
    
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
                                coins = DefaultValues.coins
                                playingHighscore = DefaultValues.coins
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
                        AchievementScreen()
                    } label: {
                        MenuButton(text: "Achievements")
                    }
                    
                    NavigationLink {
                        SettingScreen()
                    } label: {
                        MenuButton(text: "Settings")
                    }
                    
                    NavigationLink {
                        HowToPlayScreen()
                    } label: {
                        MenuButton(text: "How To Play")
                    }
                    
                    Spacer()
                }
                .modifier(ScreenMod())
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                playSound(sound: "cottagecore", type: "mp3")
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
            .previewInterfaceOrientation(.portrait)
    }
}
