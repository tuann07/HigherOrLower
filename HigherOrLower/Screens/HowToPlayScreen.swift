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

struct HowToPlayScreen: View {
    var body: some View {
        ZStack {
            Color("Blue400")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                VStack {
                    Text("You are given 3 cards, calculate the sum of those cards")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(Color("Blue700").opacity(0.8))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                    
                    Text("Take a guess if your sum is greater or smaller than the opponents' by clicking on up or down arrow")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(Color("Blue700").opacity(0.8))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                    
                    Text("Click the play button to have guess again")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(Color("Blue700").opacity(0.8))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                    
                    Text("You can choose to gamble more by doubling the bets or going all in")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(Color("Blue700").opacity(0.8))
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
