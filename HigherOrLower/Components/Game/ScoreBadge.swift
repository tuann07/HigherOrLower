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

struct ScoreBadge: View {
    var imageName: String
    var title: String
    var number: String
    var highlight: Bool = false
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .modifier(IconMod())
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 12, design: .rounded))
                    .foregroundColor(Color("Blue700").opacity(0.5))
                
                Text(number)
                    .font(.system(size: 16, design: .rounded).weight(.bold))
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .frame(maxWidth: 200, alignment: .leading)
        .background(Color("Blue300"))
        .shadow(color: highlight ? Color("Yellow") : Color("Blue700").opacity(0.1), radius: 10)
        .modifier(CornerMod())
    }
}

struct ScoreBadge_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBadge(imageName: "crown", title: "Highscore", number: "19023", highlight: true)
    }
}
