//
//  CustomTabbar.swift
//  Week-4_Part-1
//
//  Created by Yavuz Alp GÜLER on 14.05.2021.
//

import UIKit


//Githubda open source bir projeden boyle bir implementasyon buldum,
//nasil yapildigini anladim ancak kendim sifirdan yapmaya kalktigimda yapamamistim :(
//Burada da super oldugu soylenemez ancak yine de istenileni karsiliyor gibi geldi :)
class CustomTabbar: UITabBar {
    private var shapeLayer: CALayer?

       private func addShape() {
           let shapeLayer = CAShapeLayer()
           shapeLayer.path = createPath()
           shapeLayer.strokeColor = UIColor.lightGray.cgColor
           shapeLayer.fillColor = UIColor.white.cgColor
           shapeLayer.lineWidth = 1.0

           if let oldShapeLayer = self.shapeLayer {
               self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
           } else {
               self.layer.insertSublayer(shapeLayer, at: 0)
           }

           self.shapeLayer = shapeLayer
       }

       override func draw(_ rect: CGRect) {
           self.addShape()
       }

       func createPath() -> CGPath {

           let height: CGFloat = 30.0
           let path = UIBezierPath()
           let centerWidth = self.frame.width / 2

           path.move(to: CGPoint(x: 0, y: 0)) // start top left
           path.addLine(to: CGPoint(x: (centerWidth - height * 2), y: 0)) // the beginning of the trough
           // first curve down
           path.addCurve(to: CGPoint(x: centerWidth, y: -25.0),
                         controlPoint1: CGPoint(x: (centerWidth - 15), y: 0), controlPoint2: CGPoint(x: centerWidth - 36, y: -18))
           // second curve up
           path.addCurve(to: CGPoint(x: (centerWidth + height * 2), y: 0),
                         controlPoint1: CGPoint(x: centerWidth + 36, y: -18), controlPoint2: CGPoint(x: (centerWidth + 15), y: 0))

           // complete the rect
           path.addLine(to: CGPoint(x: self.frame.width, y: 0))
           path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
           path.addLine(to: CGPoint(x: 0, y: self.frame.height))
           path.close()

           return path.cgPath
       }

          
       }
