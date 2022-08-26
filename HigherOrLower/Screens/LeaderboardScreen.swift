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

let ranks = ["Orange", "Yellow", "Blue700", "Blue300"]

struct LeaderboardScreen: View {
    private var leaderboard: [String: String] = UserDefaults.standard.object(forKey: "leaderboard") as? [String: String] ?? [:]
    
    private var sortedLeaderboard: [(String, String)] {
        return leaderboard.sorted{ return $0.value > $1.value }
    }
    
    var body: some View {
        ZStack {
            Color("Blue400")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ForEach((0..<sortedLeaderboard.count), id: \.self) { i in
                    LeaderboardBar(rank: String(i+1), color: ranks[i > 3 ? 3 : i], name: sortedLeaderboard[i].0, points: sortedLeaderboard[i].1, darkText: i > 2)
                }
                
                Spacer()
            }
        }
        .navigationTitle("Leaderboard")
        .onAppear(perform: {
            var temp = leaderboard
            temp["tuan7"] = "20980"
            UserDefaults.standard.set(temp, forKey: "leaderboard")
        })
    }
}

struct LeaderboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardScreen()
    }
}
