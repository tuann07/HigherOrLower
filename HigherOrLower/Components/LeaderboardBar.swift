//
//  LeaderboardBar.swift
//  HigherOrLower
//
//  Created by Anh Nguyen on 8/25/22.
//

import SwiftUI

struct LeaderboardBar: View {
    var rank: String
    var color: String
    var name: String
    var points: String
    var darkText: Bool = false
    
    var body: some View {
        HStack {
            Text(rank)
                .fontWeight(.bold)
                .font(.system(.body, design: .rounded))
                .foregroundColor(Color(color))
                .frame(width: 40, height: 40, alignment: .center)
                .background(darkText ? Color("Blue500") : .white)
                .cornerRadius(100)
                
                
            
            Text(name)
                .bold()
                .font(.system(.title2, design: .rounded))
                .foregroundColor(darkText ? Color("Blue500") : .white)
            
            Spacer()
            
            Text(points)
                .bold()
                .font(.system(.body, design: .rounded))
                .foregroundColor(darkText ? Color("Blue500") : .white)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(Color(color))
                .cornerRadius(20)
        }
        .frame(width: 300, alignment: .center)
        .padding()
        .background(LinearGradient(colors: [Color(color), .white], startPoint: .leading, endPoint: .trailing))
        .cornerRadius(10)
    }
}

struct LeaderboardBar_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardBar(rank: "1", color: "Blue300", name: "Tuan", points: "1290", darkText: true)
    }
}
