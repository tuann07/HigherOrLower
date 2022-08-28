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

enum Difficulty: Int {
    case easy = 1
    case hard = 2
}

enum AppStorageKeys: String {
    case highscore = "highscore"
    case playingHighscore = "playing-highscore"
    case coins = "coins"
    case leaderboard = "leaderboard"
    case username = "username"
    case difficulty = "difficulty"
}

let coinsDefault = 100
let usernameDefault = "player1"
let difficultyDefault = Difficulty.easy
