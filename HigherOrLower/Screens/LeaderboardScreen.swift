//
//  LeaderboardScreen.swift
//  HigherOrLower
//
//  Created by Anh Nguyen on 8/25/22.
//

import SwiftUI

let ranks = ["Orange", "Yellow", "Blue700", "Blue300"]

struct LeaderboardScreen: View {
    @State private var leaderboard: [String: String] = UserDefaults.standard.object(forKey: "leaderboard") as? [String: String] ?? [:]
    
//    @State private var sortedLeaderboard: [(String, String)] {
//        return leaderboard.sorted{ return $0.value > $1.value }
//    }
    
    var body: some View {
        ZStack {
            Color("Blue400")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                //                LeaderboardBar(rank: "1st", color: "Orange", name: "Tuan", points: "1290")
                //                LeaderboardBar(rank: "2nd", color: "Yellow", name: "Tuan", points: "1390")
                //                LeaderboardBar(rank: "3rd", color: "Blue700", name: "Tuan", points: "1490")
                //
                //                LeaderboardBar(rank: "4th", color: "Blue300", name: "Tuan1", points: "1490", darkText: true)
                //                LeaderboardBar(rank: "5th", color: "Blue300", name: "Tuan2", points: "1490", darkText: true)
                //                LeaderboardBar(rank: "6th", color: "Blue300", name: "Tuan3", points: "1490", darkText: true)
                    
//                ForEach(0..<sortedLeaderboard.count) { i in
//                    LeaderboardBar(rank: "1", color: "Orange", name: sortedLeaderboard[i][0], points: sortedLeaderboard[i][1], darkText: true)
//                }
                
                Spacer()
            }
        }
        .navigationTitle("Leaderboard")
    }
}

struct LeaderboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardScreen()
    }
}
