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

let ranks = ["Orange", "Yellow", "Blue700", "Blue300"]

func getLeaderboard() -> [(String, Int)] {
    let leaderboard: [String: Int] = UserDefaults.standard.object(forKey: "leaderboard") as? [String: Int] ?? [:]
    
    return leaderboard.sorted{ return $0.value > $1.value }
}

struct LeaderboardScreen: View {
    var body: some View {
        ZStack {
            Color("Blue400")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    ForEach((0..<getLeaderboard().count), id: \.self) { i in
                        LeaderboardBar(rank: String(i+1), color: ranks[i > 3 ? 3 : i], name: getLeaderboard()[i].0, points: String(getLeaderboard()[i].1), darkText: i > 2)
                    }
                    
                    Spacer()
                }
            }
            .modifier(ScreenMod())
        }
        .navigationTitle("Leaderboard")
    }
}

struct LeaderboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardScreen()
    }
}
