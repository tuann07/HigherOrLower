/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Anh Tuan
  ID: 3817907
  Created  date: 26/08/2022
  Last modified: 26/08/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

let iconList = ["ace", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "jack", "queen", "king"]
let baseBet = 10

struct GameScreen: View {
    @AppStorage("username") private var username = "player1"
    @AppStorage("highscore") private var highscore = 100
    @AppStorage("playing-highscore") private var playingHighscore = 100
    
    @State private var playerCards = [0, 1, 2]
    @State private var compCards = [0, 1, 2]
    
    @State private var compShow = false
    
    @State private var playerShow = false
    @AppStorage("coins") private var coins = 100
    @State private var bets = 10
    
    @State private var x2Choosen = false
    @State private var allInChoosen = false
    
    @State private var start = false
    
    @State private var isGameover = false
    
    @State private var animating = false
    
    func play() {
        playingHighscore = highscore + 1000
        isGameover = true
        
        self.start = true
        self.compShow = false
        self.playerShow = true
        self.playerCards = self.playerCards.map({ _ in
            Int.random(in: 0..<iconList.count)
        })
        self.compCards = self.compCards.map({ _ in
            Int.random(in: 0..<iconList.count)
        })
    }
    
    func guess() -> [Int]{
        if (self.allInChoosen) {
            bets = coins
        }
        self.start = false
        self.compShow = true
        
        let playerSum = self.playerCards[0] + self.playerCards[1] + self.playerCards[2]
        let compSum = self.compCards[0] + self.compCards[1] + self.compCards[2]
        
        return [playerSum, compSum]
    }
    
    func guessUp() {
        let guesses = self.guess()
        
        guesses[0] > guesses[1] ? guessRight() : guessWrong()
    }
    func guessDown() {
        let guesses = self.guess()
        
        guesses[0] < guesses[1] ? guessRight() : guessWrong()
    }
    
    func guessRight() {
        playSound(sound: "guess-right", type: "wav")
        self.coins += self.bets
        
        if self.coins > self.playingHighscore {
            self.updatePlayingHighscore()
        }
    }
    func guessWrong() {
        playSound(sound: "guess-wrong", type: "wav")
        self.coins -= bets
        
        if self.coins <= 0 {
            self.isGameover = true
        }
    }
    
    func updatePlayingHighscore() {
        self.playingHighscore = self.coins
    }
    
    func updateHighscore() {
        if playingHighscore > highscore {
            self.highscore = self.playingHighscore
        }
    }
    func saveToLeaderboard() {
        var leaderboard = UserDefaults.standard.object(forKey: "leaderboard") as? [String: Int] ?? [:]
        leaderboard[username] = playingHighscore
        UserDefaults.standard.set(leaderboard, forKey: "leaderboard")
    }
    
    func newGame() {
        self.saveToLeaderboard()
        self.updateHighscore()
        self.isGameover = false
        self.coins = 100
        self.playingHighscore = 100
    }
    
    func x2Select() {
        self.x2Choosen.toggle()
        self.allInChoosen = false
        
        if (x2Choosen) {
            bets = baseBet * 2
        } else {
            bets = baseBet
        }
    }
    
    func allInSelect() {
        self.allInChoosen.toggle()
        self.x2Choosen = false
        
        if (allInChoosen) {
            bets = coins
        } else {
            bets = baseBet
        }
    }
    
    func isNewHighscore() -> Bool {
        return playingHighscore > highscore
    }
    
    var body: some View {
        ZStack {
            Color("Blue400")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    // MARK: HIGHSCORE
                    Badge(imageName: "crown", title: "Highscore", number: String(isNewHighscore() ? playingHighscore : highscore), highlight: isNewHighscore())
                    
                    Spacer()
                    
                    //  MARK: COINS
                    Badge(imageName: "coin", title: "Coins", number: String(coins))
                }
                
                Spacer()
                
                VStack {
                    // MARK: COMPUTER
                    ZStack{
                        HStack {
                            Group {
                                Image(iconList[compCards[0]])
                                    .resizable()
                                Image(iconList[compCards[1]])
                                    .resizable()
                                Image(iconList[compCards[2]])
                                    .resizable()
                            }
                            .modifier(CardMod())
                            .opacity(compShow ? 1 : 0)
                            .rotationEffect(.degrees(compShow ? 0 : 90))
                            .animation(.easeOut(duration: 0.5), value: compShow)
                        }
                        
                        HStack {
                            Group {
                                Image("poker-cards")
                                    .resizable()
                                Image("poker-cards")
                                    .resizable()
                                Image("poker-cards")
                                    .resizable()
                            }
                            .modifier(CardMod())
                            .opacity(compShow ? 0 : 1)
                            .rotationEffect(.degrees(compShow ? 90 : 0))
                            .animation(.easeOut(duration: 0.3), value: compShow)
                        }
                        
                    }
                    
                    // MARK: BUTTONS
                    ZStack {
                        HStack {
                            // MARK: DOWN
                            Button {
                                self.guessDown()
                            } label: {
                                Image("down-arrow")
                                    .resizable()
                                    .opacity(start ? 1 : 0.5)
                                    .modifier(ArrowMod())
                            }.disabled(!start)
                            
                            // MARK: PLAY
                            Button {
                                withAnimation {
                                    animating = true
                                }
                                self.play()
                                withAnimation {
                                    animating = false
                                }
                            } label: {
                                Image("play")
                                    .resizable()
                                    .opacity(start ? 0.5 : 1)
                                    .modifier(ArrowMod())
                            }.disabled(start)
                            
                            // MARK: UP
                            Button {
                                self.guessUp()
                            } label: {
                                Image("up-arrow")
                                    .resizable()
                                    .opacity(start ? 1 : 0.5)
                                    .modifier(ArrowMod())
                            }.disabled(!start)
                        }
                    }
                    
                    // MARK: - PLAYER
                    ZStack {
                        HStack {
                            Group {
                                Image(iconList[playerCards[0]])
                                    .resizable()
                                Image(iconList[playerCards[1]])
                                    .resizable()
                                Image(iconList[playerCards[2]])
                                    .resizable()
                            }
                            .modifier(CardMod())
                            .opacity(animating ? 0 : 1)
                            .offset(y: animating ? 50 : 0)
                            .animation(.easeOut(duration: 0.5), value: animating)
                        }
                    }
                }
                .padding()
                .background(Color("Blue700"))
                .cornerRadius(10)
                .modifier(ShadowMod())
                
                Spacer()
                
                // MARK: BUFF
                HStack {
                    Spacer()
                    
                    Button {
                        self.x2Select()
                    } label: {
                        Text("x2")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Blue700"))
                    }
                    .padding()
                    .background(Color(x2Choosen ? "Yellow" : "Blue300"))
                    .cornerRadius(10)
                    .modifier(ShadowMod())
                    
                    Spacer()
                    
                    Button {
                        self.allInSelect()
                    } label: {
                        Text("All In")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Blue700"))
                    }
                    .padding()
                    .background(Color(allInChoosen ? "Yellow" : "Blue300"))
                    .cornerRadius(10)
                    .modifier(ShadowMod())
                    
                    Spacer()
                }
            }
            .padding()
            
            if isGameover {
                // MARK: MODAL
                ZStack{
                    Color(.black)
                        .opacity(0.66)
                        .edgesIgnoringSafeArea(.all)
                    
                    // MARK: MODAL CONTENT
                    VStack{
                        // MARK: TITLE
                        Text(isNewHighscore() ? "Congratulation" : "GAME OVER")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .frame(minWidth: 280, idealWidth: 280, maxWidth: 320)
                            .background(Color("Red"))
                        
                        Spacer()
                        
                        // MARK: BODY
                        VStack {
                            Text(isNewHighscore() ? "You set a new highscore.\nKeep up the good work." : "You almost got there.\nGive it another try.")
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(Color.white)
                                .padding(.bottom)
                                .multilineTextAlignment(.center)
                            
                            Text("Highscore")
                                .font(.system(.body, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 5)
                            
                            Text("This game: " + String(playingHighscore))
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(Color.white)
                            
                            Text("All time: " + String(highscore))
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(Color.white)
                            
                        }
                        
                        Spacer()
                        
                        // MARK: BUTTON
                        Button {
                            self.newGame()
                        } label: {
                            Text("New Game")
                                .fontWeight(.bold)
                                .foregroundColor(Color("Blue700"))
                                .padding(.vertical, 15)
                                .padding(.horizontal, 70)
                                .background(Color("Yellow"))
                                .cornerRadius(10)
                        }
                    }
                    .padding(20)
                    .opacity(isGameover ? 1 : 0)
                    .frame(width:320, height: 380, alignment: .center)
                    .background(Color("Blue700"))
                    .cornerRadius(10)
                } //ZStack
                .onAppear(perform: {
                    if isNewHighscore() {
                        playSound(sound: "new-highscore", type: "wav")
                    } else {
                        playSound(sound: "sad-gameover", type: "wav")
                    }
                })
            }
        } // ZStack
        .navigationTitle("Higher Or Lower")
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen()
    }
}
