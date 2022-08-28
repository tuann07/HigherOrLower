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

struct HowToPlayText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(.body, design: .rounded))
            .foregroundColor(Color("Blue700").opacity(0.8))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct HowToPlayText_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayText(text: "text")
    }
}
