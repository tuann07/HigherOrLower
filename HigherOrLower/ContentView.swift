/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Anh Tuan
  ID: 3817907
  Created  date: 05/08/2022
  Last modified: 26/08/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

let iconList = ["ace", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "jack", "queen", "king"]

struct ContentView: View {
    @AppStorage("highscore") private var highscore = 0
    @AppStorage("playingHighscore") private var playingHighscore = 0
    
    @State private var playerCards = [0, 1, 2]
    @State private var compCards = [0, 1, 2]
    
    @State private var playerShow = false
    @State private var compShow = false
    
    @AppStorage("coins") private var coins = 100
    @State private var bets = 10
    
    @State private var start = false
    
    @State private var animatingChange = false
    @State private var animatingFlip = false
    
    @State private var isGameover = false
    
    func play() {
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
        self.coins += self.bets
        
        if self.coins > self.playingHighscore {
            self.updateHighscore()
        }
    }
    func guessWrong() {
        self.coins -= bets
        
        if self.coins < 0 {
            self.isGameover = true
        }
    }
    
    func updateHighscore() {
        self.playingHighscore = self.coins
        
        if playingHighscore > highscore {
            self.highscore = self.playingHighscore
        }
    }
    
    func newGame() {
        self.isGameover = false
        self.coins = 100
    }
    
    var body: some View {
        ZStack {
            Color("Blue400")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Higher Or Lower")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Blue700"))
                
                Spacer()
                
                HStack {
                    // MARK: HIGHSCORE
                    HStack {
                        Image("crown")
                            .resizable()
                            .modifier(ArrowMod())
                        
                        VStack(alignment: .leading) {
                            Text("Highscore")
                                .modifier(BadgeTitleMod())
                            
                            Text(String(highscore))
                                .modifier(BadgeValueMod())
                        }
                    }
                    .modifier(BadgeMod())
                    
                    Spacer()
                    
                    //  MARK: COINS
                    HStack {
                        Image("coin")
                            .resizable()
                            .modifier(ArrowMod())
                        
                        VStack(alignment: .leading) {
                            Text("Coins")
                                .modifier(BadgeTitleMod())
                            
                            Text(String(coins))
                                .modifier(BadgeValueMod())
                        }
                    }
                    .modifier(BadgeMod())
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
                            .opacity(animatingFlip ? 1 : 0)
                            .rotationEffect(.degrees(animatingFlip ? 0 : 180))
                            .animation(.easeOut(duration: 0.5), value: animatingFlip)
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
                            .opacity(animatingFlip ? 0 : 1)
                            .rotationEffect(.degrees(animatingFlip ? 180 : 0))
                            .animation(.easeOut(duration: 0.5), value: animatingFlip)
                        }
                        
                    }
                    
                    // MARK: BUTTONS
                    ZStack {
                        HStack {
                            // MARK: DOWN
                            Button {
                                withAnimation {
                                    self.animatingFlip = false
                                }
                                
                                self.guessDown()
                                
                                withAnimation {
                                    self.animatingFlip = true
                                }
                            } label: {
                                Image("down-arrow")
                                    .resizable()
                                    .opacity(start ? 1 : 0.5)
                                    .modifier(ArrowMod())
                            }.disabled(!start)
                            
                            // MARK: PLAY
                            Button {
                                withAnimation {
                                    self.animatingChange = false
                                    self.animatingFlip = false
                                }

                                self.play()

                                withAnimation {
                                    self.animatingChange = true
                                    self.animatingFlip = true
                                }
//                                isGameover = true
                            } label: {
                                Image("play")
                                    .resizable()
                                    .opacity(start ? 0.5 : 1)
                                    .modifier(ArrowMod())
                            }.disabled(start)
                            
                            // MARK: UP
                            Button {
                                withAnimation {
                                    self.animatingFlip = false
                                }
                                
                                self.guessUp()
                                
                                withAnimation {
                                    self.animatingFlip = true
                                }
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
                            .opacity(animatingChange ? 1 : 0)
                            .rotationEffect(.degrees(animatingChange ? 0 : 45))
                            .animation(.easeOut(duration: 0.5), value: animatingChange)
                            .onAppear(perform: {self.animatingChange.toggle()})
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
                            .opacity(playerShow ? 0 : 1)
                            
                        }
                    }
                }
                .padding()
                .background(Color("Blue700"))
                .cornerRadius(10)
                .modifier(ShadowMod())
                
                Spacer()
            }
            .padding()
            
            if isGameover {
                // MARK: MODAL
                ZStack{
                    Color("Blue700")
                        .opacity(0.66)
                        .edgesIgnoringSafeArea(.all)
                    
                    // MARK: MODAL CONTENT
                    VStack{
                        // MARK: TITLE
                        Text("GAME OVER")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)                            .frame(minWidth: 280, idealWidth: 280, maxWidth: 320)
                            .background(Color("Red"))
                        
                        Spacer()
                        
                        // MARK: BODY
                        VStack {
                            Text("HIGHSCORE")
                                .font(.system(.body, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding(.bottom)
                            HStack {
                                Text("This game: ")
                                    .font(.system(.body, design: .rounded))
                                    .foregroundColor(Color.white)
                                Text(String(playingHighscore))
                                    .font(.system(.body, design: .rounded))
                                    .foregroundColor(Color.white)
                            }.padding(.bottom, 5)
                            HStack {
                                Text("All time: ")
                                    .font(.system(.body, design: .rounded))
                                    .foregroundColor(Color.white)
                                Text(String(highscore))
                                    .font(.system(.body, design: .rounded))
                                    .foregroundColor(Color.white)
                            }
                        }
                        
                        Spacer()
                        
                        // MARK: BUTTON
                        Button {
                            self.newGame()
                        } label: {
                            Text("New Game")
                                .fontWeight(.bold)
                                .foregroundColor(Color("Blue700"))
                        }
                        .padding(.vertical, 15)
                        .padding(.horizontal, 70)
                        .background(Color("Yellow"))
                        .cornerRadius(10)
                        
                    }
                    .padding(20)
                    .opacity(isGameover ? 1 : 0)
                    .frame(width:300, height: 320, alignment: .center)
                    .background(Color("Blue700"))
                    .cornerRadius(10)
                    .animation(.easeOut(duration: 1), value: animatingChange)
                    .onAppear(perform: {
                        self.animatingChange.toggle()
                    })
                    .onDisappear(perform: {
                        self.animatingChange.toggle()
                    })
                } //ZStack
            }
        } // ZStack
    } // ZStack
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
