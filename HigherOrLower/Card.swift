//
//  Card.swift
//  HigherOrLower
//
//  Created by Tuan Nguyen Anh on 05/08/2022.
//

import SwiftUI

let iconList = ["spades", "clubs", "diamond", "heart"]
let textList = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

struct Card: View {
    var isRevealed: Bool
    var textIndex: Int
    let icon = iconList[Int.random(in: 0..<4)]
    
    var body: some View {
        Rectangle()
            .fill(.white)
            .frame(width: 80, height: 120, alignment: .center)
            .border(.black.opacity(0.8), width: 2)
            .clipped()
            .overlay(
                VStack {
                    if isRevealed {
                        VStack {
                            HStack {
                                Text(textList[textIndex])
                                    .font(.system(.title))
                                
                                Spacer()
                            }
                            
                            Spacer()
                            
                            HStack {
                                Spacer()
                                Image(icon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, alignment: .center)
                            }
                        }
                    }
                    
                    if !isRevealed {
                        Image("poker")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, alignment: .center)
                    }
                }.padding(7)
            )
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(isRevealed: true, textIndex: 1)
    }
}
