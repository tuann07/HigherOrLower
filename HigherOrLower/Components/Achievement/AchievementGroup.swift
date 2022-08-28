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

struct AchievementGroup: View {
    var name: String
    var points: Int
    
    var achievements: [String] {
        var temp = [String]()
        
        if points >= 1_000 {
            temp.append("1,000")
        }
        if points >= 5_000 {
            temp.append("5,000")
        }
        if points >= 10_000 {
            temp.append("Incredible!")
        }
        if points >= 50_000 {
            temp.append("Uhm. Something fishy")
        }
        if points >= 100_000 {
            temp.append("Nice try, alien")
        }
        
        return temp
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("User: " + String(name))
                    .bold()
                    .font(.system(.body, design: .rounded))
                Spacer()
            }
            
            VStack {
                ForEach(achievements, id: \.self) { achievement in
                    AchievementBadge(text: achievement)
                }
            }
            
        }
        .padding()
        .background(Color("Blue300"))
        .modifier(CornerMod())
    }
}

struct AchievementGroup_Previews: PreviewProvider {
    static var previews: some View {
        AchievementGroup(name: "Tuan", points: 100000)
    }
}
