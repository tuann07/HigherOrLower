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

struct LeaderboardBar: View {
    var rank: String
    var color: String
    var name: String
    var points: String
    var darkText: Bool = false
    
    var body: some View {
        HStack {
            Text(rank)
                .fontWeight(.bold)
                .font(.system(.body, design: .rounded))
                .foregroundColor(Color(color))
                .frame(width: 40, height: 40, alignment: .center)
                .background(darkText ? Color("Blue500") : .white)
                .cornerRadius(100)
            
            Text(name)
                .bold()
                .font(.system(.title2, design: .rounded))
                .foregroundColor(darkText ? Color("Blue500") : .white)
            
            Spacer()
            
            Text(points)
                .bold()
                .font(.system(.body, design: .rounded))
                .foregroundColor(darkText ? Color("Blue500") : .white)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(Color(color))
                .cornerRadius(20)
        }
        .padding()
        .background(LinearGradient(colors: [Color(color), .white], startPoint: .leading, endPoint: .trailing))
        .modifier(CornerMod())
    }
}

struct LeaderboardBar_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardBar(rank: "1", color: "Blue300", name: "Tuan", points: "1290", darkText: true)
    }
}
