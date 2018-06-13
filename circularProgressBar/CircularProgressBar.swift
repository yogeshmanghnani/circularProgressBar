//
//  CircularProgressBar.swift
//  attendance-manager
//
//  Created by Yogesh Manghnani on 02/05/18.
//  Copyright © 2018 Yogesh Manghnani. All rights reserved.
//

import UIKit


class CircularProgressBar: UIView {
    
    
    var lineWidth:CGFloat = 50
    
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
        makeBar(percentage: 50)
    }
    
    
    
    public func makeBar(percentage: Double){
        self.layer.sublayers = nil
        drawBackgroundLayer()
        drawForegroundLayer(percentage: percentage)
    }
    
    private func drawForegroundLayer(percentage: Double){
        
        let startAngle = (-CGFloat.pi/2)
        let endAngle = 2 * CGFloat.pi * CGFloat(percentage / 100) + startAngle
        
        let layer = CAShapeLayer()
        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        layer.lineCap = kCALineCapRound
        layer.path = path.cgPath
        layer.lineWidth = lineWidth
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.red.cgColor
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        layer.add(animation, forKey: "foregroundAnimation")
        
        
        self.layer.addSublayer(layer)
        
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


}
