//
//  PathExtension.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit
import CoreGraphics

extension CGPath {
    class func sinPath(startPoint: CGPoint, width: CGFloat, height: CGFloat, periods: CGFloat) -> CGPath {
        let path = UIBezierPath()
        let maxAngle: CGFloat = 2 * CGFloat.pi * periods
        let iterations = Int(min(1000, 100 * periods))
        let point = { (angle: CGFloat) -> CGPoint in
            let x = startPoint.x + angle / maxAngle * width
            let y = startPoint.y - sin(angle) * height
            return CGPoint(x: x, y: y)
        }
        
        path.move(to: startPoint)
        
        for i in 1...iterations {
            path.addLine(to: point(maxAngle * CGFloat(i) / CGFloat(iterations)))
        }
        return path.cgPath
    }
}
