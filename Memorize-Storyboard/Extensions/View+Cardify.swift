//
//  View+Cardify.swift
//  Memorize-Storyboard
//
//  Created by Pradyumn Shukla on 13/01/21.
//

import SwiftUI

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, cornerRadius: 5, edgeLineWidth: 3))
    }
}
