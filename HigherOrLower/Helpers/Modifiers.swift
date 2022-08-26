/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Anh Tuan
  ID: 3817907
  Created  date: 05/08/2022
  Last modified: 26/08/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct ArrowMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 50, height: 50, alignment: .center)
    }
}

struct ShadowMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("Blue700").opacity(0.1), radius: 10)
    }
}

struct BadgeMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .padding(.vertical, 10)
            .frame(width: 150, alignment: .leading)
            .background(Color("Blue300"))
            .cornerRadius(10)
            .modifier(ShadowMod())
    }
}

struct BadgeTitleMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, design: .rounded))
            .foregroundColor(Color("Blue700").opacity(0.5))
    }
}

struct BadgeValueMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, design: .rounded).weight(.bold))
    }
}

struct CardMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .modifier(ShadowMod())
    }
}
