//
//  CircularProgressBar.swift
//  attendance-manager
//
//  Created by Yogesh Manghnani on 02/05/18.
//  Copyright © 2018 Yogesh Manghnani. All rights reserved.
//

import UIKit


class CircularProgressBar: UIView {
    
    
    public var lineWidth:CGFloat = 50
    
    private let foregroundLayer = CAShapeLayer()
    
    private var radius: CGFloat {
        get{
            return 100
        }
    }
    
    
    private var pathCenter: CGPoint{
        get{
            return self.convert(self.center, from:self.superview)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeBar()
    }
    
    
    
    private func makeBar(){
        self.layer.sublayers = nil
        drawBackgroundLayer()
        drawForegroundLayer()
    }
    
    private func drawBackgroundLayer(){
        let layer = CAShapeLayer()
        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        layer.path = path.cgPath
        layer.strokeColor = UIColor.lightGray.cgColor
        layer.lineWidth = lineWidth - (lineWidth * 20/100)
        layer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(layer)
        
    }
    
    private func drawForegroundLayer(){
        
        let startAngle = (-CGFloat.pi/2)
        let endAngle = 2 * CGFloat.pi + startAngle
        
        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        foregroundLayer.lineCap = kCALineCapRound
        foregroundLayer.path = path.cgPath
        foregroundLayer.lineWidth = lineWidth
        foregroundLayer.fillColor = UIColor.clear.cgColor
        foregroundLayer.strokeColor = UIColor.red.cgColor
        foregroundLayer.strokeEnd = 0
        
        self.layer.addSublayer(foregroundLayer)
        
    }
    
    
    public func setProgress(to progressConstant: Double, withAnimation: Bool) {
        
        var progress: Double {
            get {
                if progressConstant > 1 { return 1 }
                else if progressConstant < 0 { return 0 }
                else { return progressConstant }
            }
        }
        
        foregroundLayer.strokeEnd = CGFloat(progress)
        
        if withAnimation {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.toValue = progress
            animation.duration = 2
            foregroundLayer.add(animation, forKey: "foregroundAnimation")
        }
        
    }
    

    
}
