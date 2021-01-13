//
//  Cardify.swift
//  Memorize-Storyboard
//
//  Created by Pradyumn Shukla on 13/01/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    var cornerRadius: CGFloat
    var edgeLineWidth: CGFloat
    func body(content: Content) -> some View {
        ZStack {
            if(isFaceUp) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeLineWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill()
            }
        }
    }
}


