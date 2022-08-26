//
//  StatBadge.swift
//  HigherOrLower
//
//  Created by Anh Nguyen on 8/25/22.
//

import SwiftUI

struct Badge: View {
    var imageName: String
    var title: String
    var number: String
    var highlight: Bool = false
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .modifier(ArrowMod())
            
            VStack(alignment: .leading) {
                Text(title)
                    .modifier(BadgeTitleMod())
                
                Text(number)
                    .modifier(BadgeValueMod())
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .frame(width: 150, alignment: .leading)
        .background(Color("Blue300"))
        .cornerRadius(10)
        .shadow(color: highlight ? Color("Yellow") : .black.opacity(0.1), radius: 10)
    }
}

struct StatBadge_Previews: PreviewProvider {
    static var previews: some View {
        Badge(imageName: "crown", title: "Highscore", number: "19023", highlight: true)
    }
}
