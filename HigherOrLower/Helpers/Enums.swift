/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Anh Tuan
  ID: 3817907
  Created  date: 26/08/2022
  Last modified: 28/08/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import Foundation

enum Difficulties: Int {
    case easy = 1
    case hard = 2
}

struct AppStorageKeys {
    static let highscore = "highscore"
    static let playingHighscore = "playing-highscore"
    static let coins = "coins"
    static let leaderboard = "leaderboard"
    static let username = "username"
    static let difficulty = "difficulty"
}

struct DefaultValues {
    static let coins = 100
    static let username = "player1"
    static let difficulty = Difficulties.easy
}
