//
//  PieView.swift
//  Memorize-Storyboard
//
//  Created by Pradyumn Shukla on 13/01/21.
//

import SwiftUI


struct PieView: Shape {
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        let center: CGPoint = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height)/2
        let start: CGPoint = CGPoint(
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * sin(CGFloat(startAngle.radians))
        )
        
        return Path() { path in
            path.move(to: center)
            path.addLine(to: start)
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            path.addLine(to: center)
        }
    }
}
