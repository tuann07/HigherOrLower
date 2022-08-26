//
//  HowToPlayScreen.swift
//  HigherOrLower
//
//  Created by Anh Nguyen on 8/25/22.
//

import SwiftUI

struct HowToPlayScreen: View {
    var body: some View {
        ZStack {
            Color("Blue400")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Instructions")
                    .bold()
                    .font(.system(.title2))
                
                VStack {
                    Text("You are given 3 cards, calculate the sum of those cards")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.black.opacity(0.8))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                    
                    Text("Take a guess if your sum is greater or smmaller than the opponents' by clicking on either arrow")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.black.opacity(0.8))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                    
                    Text("Click the play button to have another guess")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.black.opacity(0.8))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                    
                    Text("You can choose to gamble more by double the bets or go all in")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.black.opacity(0.8))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding()
                .frame(width: 300, alignment: .center)
                .background(Color("Blue300"))
                .cornerRadius(10)
                
                Spacer()
            }
        }
        .navigationTitle("How To Play")
    }
}

struct HowToPlayScreen_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayScreen()
    }
}
