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

import SwiftUI

struct MenuButton: View {
    var text: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(text)
                .font(.system(.body, design: .rounded).weight(.bold))
                .foregroundColor(Color("Blue700"))
            Spacer()
        }
        .padding(.vertical)
        .background(Color("Blue300"))
        .modifier(CornerMod())
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(text: "New Game")
    }
}
