/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Anh Tuan
  ID: 3817907
  Created  date: 28/08/2022
  Last modified: 28/08/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct AchievementBadge: View {
    var text: String
    var color: String = "Blue400"
    
    var body: some View {
        Text(text)
            .bold()
            .font(.system(.body, design: .rounded))
            .padding()
            .background(ZStack {
                Color(color).opacity(0.8)
                
                HStack {
                    Spacer()
                    
                    Image("trophy")
                        .resizable()
                    .scaledToFit()
                    .padding(5)
                    .opacity(0.8)
                }
            })
            .cornerRadius(20)
    }
}

struct AchievementBadge_Previews: PreviewProvider {
    static var previews: some View {
        AchievementBadge(text: "1,000", color: "Yellow")
    }
}
