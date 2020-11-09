//
//  ThemeButtonView.swift
//  Memorize-Storyboard
//
//  Created by Pradyumn Shukla on 09/11/20.
//

import SwiftUI

struct ThemeButtonView: View {
    var label: String
    var currentColor: Color
    
    var body: some View {
        ZStack {
            Text("\(label)")
                .font(.largeTitle)
                .fontWeight(.medium)
                .padding(.vertical, 15)
                .frame(width: 300 )
        }
        .background(currentColor)
        .foregroundColor(.white)
        .clipShape(Capsule(style: .continuous))
        
    }
}
