//
//  ContentView.swift
//  HigherOrLower
//
//  Created by Tuan Nguyen Anh on 05/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State var playerValues = [0, 1, 2]
    @State var compValues = [0, 1, 2]
    @State var playerShow = false
    @State var compShow = false
    @State var status = "GUESS"
    
    func play() {
        compShow = false
        playerShow = true
        playerValues = playerValues.map({ _ in
            Int.random(in: 0..<textList.count)
        })
        compValues = compValues.map({ _ in
            Int.random(in: 0..<textList.count)
        })
    }
    
    func guess() -> [Int]{
        self.compShow = true
        
        let playerSum = playerValues[0] + playerValues[1] + playerValues[2] + 3
        let compSum = compValues[0] + compValues[1] + compValues[2] + 3
        
        return [playerSum, compSum]
    }
    
    func guessUp() {
        let guesses = guess()
        
        let playerSum = guesses[0]
        let compSum = guesses[1]
        
        if playerSum > compSum {
            self.status = "WIN"
        } else {
            self.status = "LOSE"
        }
    }
    
    func guessDown() {
        let guesses = guess()
        
        let playerSum = guesses[0]
        let compSum = guesses[1]
        
        if playerSum < compSum {
            self.status = "WIN"
        } else {
            self.status = "LOSE"
        }
    }
    
    var body: some View {
        VStack {
            Text(status)
            
            HStack {
                Card(isRevealed: compShow, textIndex: compValues[0])
                Card(isRevealed: compShow, textIndex: compValues[1])
                Card(isRevealed: compShow, textIndex: compValues[2])
            }
            
            HStack {
                Button {
                    self.guessUp()
                } label: {
                    Image("up-arrow")
                        .resizable()
                        .modifier(ArrowModifier())
                }
                
                Button {
                    self.guessDown()
                } label: {
                    Image("down-arrow")
                        .resizable()
                        .modifier(ArrowModifier())
                }
            }
            
            HStack {
                Card(isRevealed: playerShow, textIndex: playerValues[0])
                Card(isRevealed: playerShow, textIndex: playerValues[1])
                Card(isRevealed: playerShow, textIndex: playerValues[2])
            }
            
            Button {
                self.play()
            } label: {
                Text("Play")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
