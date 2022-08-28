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

struct HowToPlayScreen: View {
    var body: some View {
        ZStack {
            Color("Blue400")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                VStack {
                    HowToPlayText(text: "You are given 3 cards, calculate the sum of those cards")
                    
                    Divider()
                    
                    HowToPlayText(text: "Take a guess if your sum is greater or smaller than the opponents' by clicking on up or down arrow")
                    
                    Divider()
                    
                    HowToPlayText(text: "Click the play button to guess again")
                    
                    Divider()
                    
                    HowToPlayText(text: "You can choose to gamble more by doubling the bets or going all in")
                    
                }
                .padding()
                .background(Color("Blue300"))
                .modifier(CornerMod())
                
                Spacer()
            }
            .modifier(ScreenMod())
        }
        .navigationTitle("How To Play")
    }
}

struct HowToPlayScreen_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayScreen()
    }
}
