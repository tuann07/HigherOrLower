//
//  Modifiers.swift
//  HigherOrLower
//
//  Created by Tuan Nguyen Anh on 05/08/2022.
//

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
            .shadow(color: .black.opacity(0.1), radius: 10)
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
            .foregroundColor(.black.opacity(0.5))
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
