//
//  MenuButton.swift
//  HigherOrLower
//
//  Created by Anh Nguyen on 8/26/22.
//

import SwiftUI

struct MenuButton: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(.body, design: .rounded).weight(.bold))
            .foregroundColor(Color("Blue700"))
            .padding(.vertical)
            .frame(width: 250, alignment: .center)
            .background(Color("Blue300"))
            .cornerRadius(10)
            .modifier(ShadowMod())
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(text: "New Game")
    }
}
