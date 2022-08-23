//
//  ContentView.swift
//  HigherOrLower
//
//  Created by Tuan Nguyen Anh on 05/08/2022.
//

import SwiftUI

let iconList = ["ace", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "jack", "queen", "king"]

struct ContentView: View {
    @AppStorage("highscore") private var highscore = 0
    
    @State private var playerCards = [0, 1, 2]
    @State private var compCards = [0, 1, 2]
    
    @State private var playerShow = false
    @State private var compShow = false
    
    @AppStorage("coins") private var coins = 100
    @State private var bets = 10
    
    @State private var start = false
    
    @State private var animating = false
    
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
        
        if self.coins > self.highscore {
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
        self.highscore = self.coins
    }
    
    func newGame() {
        self.isGameover = false
        self.coins = 100
    }
    
    var body: some View {
        ZStack {
            Color("Blue")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    HStack {
                        Image("crown")
                            .resizable()
                            .modifier(ArrowModifier())
                        
                        VStack(alignment: .leading) {
                            Text("Highscore")
                                .font(.system(size: 12, design: .rounded))
                                .foregroundColor(.black.opacity(0.5))
                            
                            Text(String(highscore))
                                .font(.system(size: 16, design: .rounded))
                                .bold()
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.blue.opacity(0.1))
                    )
                    
                    Spacer()
                    
                    HStack {
                        Image("coin")
                            .resizable()
                            .modifier(ArrowModifier())
                        
                        VStack(alignment: .leading) {
                            Text("Coins")
                                .font(.system(size: 12, design: .rounded))
                                .foregroundColor(.black.opacity(0.5))
                            
                            Text(String(coins))
                                .font(.system(size: 16, design: .rounded))
                                .bold()
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.blue.opacity(0.1))
                    )
                }
                
                Spacer()
                
                VStack {
                    HStack {
                        if compShow {
                            Image(iconList[compCards[0]])
                                .resizable()
                                .scaledToFit()
                                .modifier(ShadowMod())
                                .animation(.easeOut(duration: 2), value: compShow)
                            Image(iconList[compCards[1]])
                                .resizable()
                                .scaledToFit()
                                .modifier(ShadowMod())
                                .animation(.easeOut(duration: 2), value: compShow)
                            Image(iconList[compCards[2]])
                                .resizable()
                                .scaledToFit()
                                .modifier(ShadowMod())
                                .animation(.easeOut(duration: 2), value: compShow)
                        } else {
                            Card(iconName: "poker-cards")
                            Card(iconName: "poker-cards")
                            Card(iconName: "poker-cards")
                        }
                        
                    }
                    
                    HStack {
                        if start {
                            Button {
                                self.guessDown()
                            } label: {
                                Image("down-arrow")
                                    .resizable()
                                    .modifier(ArrowModifier())
                            }
                            
                            Button {
                                self.guessUp()
                            } label: {
                                Image("up-arrow")
                                    .resizable()
                                    .modifier(ArrowModifier())
                            }
                        } else {
                            Button {
                                self.play()
                            } label: {
                                Image("play")
                                    .resizable()
                                    .modifier(ArrowModifier())
                            }
                        }
                    }
                    
                    HStack {
                        if playerShow {
                            Image(iconList[playerCards[0]])
                                .resizable()
                                .scaledToFit()
                                .modifier(ShadowMod())
                                .animation(.easeOut(duration: 2), value: playerShow)
                            Image(iconList[playerCards[1]])
                                .resizable()
                                .scaledToFit()
                                .modifier(ShadowMod())
                                .animation(.easeOut(duration: 2), value: playerShow)
                            Image(iconList[playerCards[2]])
                                .resizable()
                                .scaledToFit()
                                .modifier(ShadowMod())
                                .animation(.easeOut(duration: 2), value: playerShow)
                        } else {
                            Card(iconName: "poker-cards")
                            Card(iconName: "poker-cards")
                            Card(iconName: "poker-cards")
                        }
                    }
                }
                .padding(.vertical)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("Lightblue").opacity(0.3))
                        .modifier(ShadowMod())
                )
                
                Spacer()
            } // VStack
            .padding()
            
            if isGameover {
                ZStack{
                    Color("Blue")
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        Text("GAME OVER")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(minWidth: 280, idealWidth: 280, maxWidth: 320)
                            .background(Color("Red"))
                        
                        Spacer()
                        
                        VStack {
                            Text("You lost all money!\nYou are not the god of gambler!\n Good luck next time!")
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                            
                            Button {
                                self.newGame()
                            } label: {
                                Text("New Game".uppercased())
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            .padding(.vertical,10)
                            .padding(.horizontal, 20)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(Color("Blue").opacity(0.7))
                            )
                            
                        }
                        
                        Spacer()
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 280, idealHeight: 300, maxHeight: 350, alignment: .center)
                    .background(Color("Red"))
                    .cornerRadius(20)
                }
            }//ZStack
        } // ZStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
