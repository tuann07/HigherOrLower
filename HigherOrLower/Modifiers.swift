//
//  Modifiers.swift
//  HigherOrLower
//
//  Created by Tuan Nguyen Anh on 05/08/2022.
//

import SwiftUI

struct ArrowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 50, height: 50, alignment: .center)
    }
}

struct ShadowMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.1), radius: 7)
    }
}
