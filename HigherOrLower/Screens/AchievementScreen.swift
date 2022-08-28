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

struct AchievementScreen: View {
    var body: some View {
        ZStack {
            Color("Blue400")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    ForEach((0..<getLeaderboard().count), id: \.self) { i in
                        AchievementGroup(name: getLeaderboard()[i].0, points: getLeaderboard()[i].1)
                    }
                    
                    Spacer()
                }
            }
            .modifier(ScreenMod())
        }
        .navigationTitle("Achievements")
    }
}

struct ArchievementScreen_Previews: PreviewProvider {
    static var previews: some View {
        AchievementScreen()
    }
}
