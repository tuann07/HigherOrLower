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

struct SettingButton: View {
    var text: String
    var difficulty: Difficulty
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("Blue700"))
            .padding()
            .background(difficulty == Difficulty.easy ? Color("Yellow") : Color("Blue300"))
            .modifier(CornerMod())
    }
}

struct SettingButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingButton(text: "Easy", difficulty: Difficulty.easy)
    }
}
