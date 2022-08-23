//
//  Card.swift
//  HigherOrLower
//
//  Created by Tuan Nguyen Anh on 23/08/2022.
//

import SwiftUI

struct Card: View {
    var iconName: String
    
    var body: some View {
        Image(iconName)
            .resizable()
            .scaledToFit()
            .modifier(ShadowMod())
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(iconName: iconList[0])
    }
}
