/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Nguyen Anh Tuan
 ID: 3817907
 Created  date: 26/08/2022
 Last modified: 28/08/2022
 Acknowledgement: All images are made by bearicons at flaticon.com
 */

import SwiftUI

let iconList = ["ace", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "jack", "queen", "king"]
let baseBet = 10

struct GameScreen: View {
    @AppStorage(AppStorageKeys.difficulty.rawValue) private var difficulty = Difficulty.easy
    @AppStorage(AppStorageKeys.username.rawValue) private var username = usernameDefault
    @AppStorage(AppStorageKeys.highscore.rawValue) private var highscore = coinsDefault
    @AppStorage(AppStorageKeys.playingHighscore.rawValue) private var playingHighscore = coinsDefault
    @AppStorage(AppStorageKeys.coins.rawValue) private var coins = coinsDefault
    @State private var bets = 10
    
    @State private var playerCards = [0, 1, 2]
    @State private var compCards = [0, 1, 2]
    
    @State private var start = false
    @State private var isFaceUp = false
    @State private var isGameover = false
    
    @State private var isX2 = false
    @State private var isAllIn = false
    
    @State private var animating = false
    
    // randomize card
    func play() {
        playSound(sound: "play-cards", type: "wav")
        
        self.start = true
        self.isFaceUp = false
        
        self.playerCards = self.playerCards.map({ _ in
            Int.random(in: 0..<iconList.count)
        })
        self.compCards = self.compCards.map({ _ in
            Int.random(in: 0..<iconList.count)
        })
    }
    
    // calculate bets and sum
    func guess() -> [Int]{
        if (self.isAllIn) {
            self.bets = self.coins
        }
        self.start = false
        self.isFaceUp = true
        
        let playerSum = self.playerCards[0] + self.playerCards[1] + self.playerCards[2]
        let compSum = self.compCards[0] + self.compCards[1] + self.compCards[2]
        
        return [playerSum, compSum]
    }
    
    // user guess
    func guessUp() {
        let guesses = self.guess()
        
        guesses[0] > guesses[1] ? self.guessRight() : self.guessWrong()
    }
    func guessDown() {
        let guesses = self.guess()
        
        guesses[0] < guesses[1] ? self.guessRight() : self.guessWrong()
    }
    
    // guess logic
    func guessRight() {
        playSound(sound: "guess-right", type: "wav")
        
        self.coins += self.bets
        
        if self.coins > self.playingHighscore {
            self.updatePlayingHighscore()
        }
    }
    func guessWrong() {
        playSound(sound: "guess-wrong", type: "wav")
        
        self.coins -= self.bets
        
        if self.coins <= 0 {
            self.isGameover = true
        }
    }
    
    // updates
    func updatePlayingHighscore() {
        self.playingHighscore = self.coins
    }
    func updateHighscore() {
        if self.playingHighscore > self.highscore {
            self.highscore = self.playingHighscore
        }
    }
    
    // save highscore to leaderboard
    func saveToLeaderboard() {
        var leaderboard = UserDefaults.standard.object(forKey: "leaderboard") as? [String: Int] ?? [:]
        leaderboard[self.username] = self.playingHighscore
        UserDefaults.standard.set(leaderboard, forKey: "leaderboard")
    }
    
    // reset game
    func newGame() {
        self.saveToLeaderboard()
        self.updateHighscore()
        self.isGameover = false
        self.coins = coinsDefault
        self.playingHighscore = coinsDefault
    }
    
    // bets change
    func x2Select() {
        self.isX2.toggle()
        self.isAllIn = false
        
        if (isX2) {
            self.bets = baseBet * 2
        } else {
            self.bets = baseBet
        }
    }
    func allInSelect() {
        self.isAllIn.toggle()
        self.isX2 = false
        
        if (isAllIn) {
            self.bets = coins
        } else {
            self.bets = baseBet
        }
    }
    
    // checks
    func isNewHighscore() -> Bool {
        return playingHighscore > highscore
    }
    func isHardMode() -> Bool {
        return difficulty == Difficulty.hard
    }
    
    var body: some View {
        ZStack {
            Color("Blue400")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                HStack {
                    // MARK: HIGHSCORE
                    ScoreBadge(imageName: "crown", title: "Highscore", number: String(isNewHighscore() ? playingHighscore : highscore), highlight: isNewHighscore())
                    
                    Spacer()
                    
                    //  MARK: COINS
                    ScoreBadge(imageName: "coin", title: "Coins", number: String(coins))
                }
                
                Spacer()
                
                VStack {
                    // MARK: COMPUTER
                    HStack {
                        ZStack {
                            Image(iconList[compCards[0]])
                                .resizable()
                                .modifier(CardMod())
                                .opacity(isFaceUp ? 1 : 0)
                                .rotationEffect(.degrees(isFaceUp ? 0 : 90))
                                .animation(.easeOut(duration: 0.5), value: isFaceUp)
                            
                            Image("poker-cards")
                                .resizable()
                                .modifier(CardMod())
                                .opacity(isFaceUp ? 0 : 1)
                                .rotationEffect(.degrees(isFaceUp ? 90 : 0))
                                .animation(.easeOut(duration: 0.3), value: isFaceUp)
                        }
                        
                        ZStack {
                            Image(iconList[compCards[1]])
                                .resizable()
                                .modifier(CardMod())
                                .opacity(isHardMode() ? (animating ? 0 : 1) : (isFaceUp ? 1 : 0))
                                .offset(y: isHardMode() ? (animating ? 50 : 0) : 0)
                                .rotationEffect(.degrees(isHardMode() ? 0 : (isFaceUp ? 0 : 90)))
                                .animation(.easeOut(duration: 0.5), value: isHardMode() ? animating : isFaceUp)
                            
                            if !isHardMode() {
                                Image("poker-cards")
                                    .resizable()
                                    .modifier(CardMod())
                                    .opacity(isFaceUp ? 0 : 1)
                                    .rotationEffect(.degrees(isFaceUp ? 90 : 0))
                                    .animation(.easeOut(duration: 0.3), value: isFaceUp)
                            }
                        }
                        
                        ZStack {
                            Image(iconList[compCards[2]])
                                .resizable()
                                .modifier(CardMod())
                                .opacity(isFaceUp ? 1 : 0)
                                .rotationEffect(.degrees(isFaceUp ? 0 : 90))
                                .animation(.easeOut(duration: 0.5), value: isFaceUp)
                            
                            Image("poker-cards")
                                .resizable()
                                .modifier(CardMod())
                                .opacity(isFaceUp ? 0 : 1)
                                .rotationEffect(.degrees(isFaceUp ? 90 : 0))
                                .animation(.easeOut(duration: 0.3), value: isFaceUp)
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
                                    .modifier(IconMod())
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
                                    .modifier(IconMod())
                            }.disabled(start)
                            
                            // MARK: UP
                            Button {
                                self.guessUp()
                            } label: {
                                Image("up-arrow")
                                    .resizable()
                                    .opacity(start ? 1 : 0.5)
                                    .modifier(IconMod())
                            }.disabled(!start)
                        }
                    }
                    
                    // MARK: PLAYER
                    HStack {
                        Image(iconList[playerCards[0]])
                            .resizable()
                            .modifier(CardMod())
                            .opacity(animating ? 0 : 1)
                            .offset(y: animating ? 50 : 0)
                            .animation(.easeOut(duration: 0.5), value: animating)
                        
                        ZStack {
                            Image(iconList[playerCards[1]])
                                .resizable()
                                .modifier(CardMod())
                                .opacity(isHardMode() ? (isFaceUp ? 1 : 0) : (animating ? 0 : 1))
                                .offset(y: isHardMode() ? 0 : (animating ? 50 : 0))
                                .rotationEffect(.degrees(isHardMode() ? (isFaceUp ? 0 : 90) : 0))
                                .animation(.easeOut(duration: 0.5), value: isHardMode() ? isFaceUp : animating)
                            
                            if isHardMode() {
                                Image("poker-cards")
                                    .resizable()
                                    .modifier(CardMod())
                                    .opacity(isFaceUp ? 0 : 1)
                                    .rotationEffect(.degrees(isFaceUp ? 90 : 0))
                                    .animation(.easeOut(duration: 0.3), value: isFaceUp)
                            }
                        }
                        
                        Image(iconList[playerCards[2]])
                            .resizable()
                            .modifier(CardMod())
                            .opacity(animating ? 0 : 1)
                            .offset(y: animating ? 50 : 0)
                            .animation(.easeOut(duration: 0.5), value: animating)
                    }
                }
                .padding()
                .background(Color("Blue700"))
                .modifier(CornerMod())
                
                Spacer()
                
                // MARK: BETS
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
                    .background(Color(self.isX2 ? "Yellow" : "Blue300"))
                    .modifier(CornerMod())
                    
                    Spacer()
                    
                    Button {
                        self.allInSelect()
                    } label: {
                        Text("All In")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Blue700"))
                    }
                    .padding()
                    .background(Color(self.isAllIn ? "Yellow" : "Blue300"))
                    .modifier(CornerMod())
                    
                    Spacer()
                }
                
                Spacer()
            }
            .modifier(ScreenMod())
            
            // MARK: MODAL
            if self.isGameover {
                GameoverModal(highscore: self.highscore, playingHighscore: self.playingHighscore, isGameover: self.isGameover, isNewHighscore: self.isNewHighscore, newGame: self.newGame)
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
