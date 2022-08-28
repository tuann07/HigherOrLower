/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Anh Tuan
  ID: 3817907
  Created  date: 05/08/2022
  Last modified: 28/08/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct IconMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 45, height: 45, alignment: .center)
    }
}

struct ShadowMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("Blue700").opacity(0.1), radius: 10)
    }
}

struct CornerMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(10)
            .modifier(ShadowMod())
    }
}

struct CardMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .modifier(ShadowMod())
    }
}

struct ScreenMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: 600)
    }
}
